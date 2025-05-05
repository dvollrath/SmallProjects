cd "/users/dietz/dropbox/project/macronotes"

local j = 1
forvalues y = 1997(1)2017 {
	di "Processing year: " (`y')
	import excel using "./Data/Use_SUT_Framework_1997-2017_SUM.xlsx", clear sheet("`y'") cellrange(A8:BU86)

	quietly {
	local i = 1 // set index for industry number

	foreach v of varlist C-BU {
		destring `v', force replace // convert string columns to numeric
		replace `v' = 0 if `v'==. // replace missing values with zeros for matrix use
		drop if inlist(A,"Other","Used") // drop these small adjustment "industries"
		rename `v' a`i' // rename column to a#
		replace A = "a`i'" if _n==`i' // replace BEA industry code with symmetric code for industry column
		local i = `i' + 1 // increase i
	}

	gen labor = 0 // add column for labor "industry" - will turn into labor row in xpose
	gen capital = 0 // add column for capital "industry" - will turn into capital row in xpose
	drop B // lose the text description of industry
	rename A _varname // use the modified A variable to name columns in transpose
	xpose, clear varname // transpose the data - it will now be industry rows with int use columns
	rename T005 total_intermediate
	rename V001 labor_compensation
	rename V003 operating_surplus
	rename T00OTOP other_taxes
	rename VABAS value_added
	rename T018 gross_output

	gen labor = 0 // generate column for labor input "industry"
	order labor, before(total_intermediate) // move labor column next to 
	gen capital = 0 // generate column for capital input "industry"
	order capital, before(total_intermediate) // move capital column 

	egen sum_intermediate = rowtotal(a*) // re-sum intermediates because of dropped "Other"/"Used"
	egen total_gdp = sum(value_added) // sum value-added to get total GDP
	gen share_gdp = value_added/total_gdp // share of GDP for each industry

	mat YearResult = [`y'] // set up results matrix for year
	mat colnames YearResult = year

	foreach x in 50 75 100{ // for different assumptions about capital costs percent of operating surplus
		capture drop cost_factor
		gen cost_factor = 1/(sum_intermediate + labor_compensation + (`x'/100)*operating_surplus) // total costs, with assump about oper surplus
		replace cost_factor = 0 if cost_factor==. // labor and capital "industries" will have missing factor (due to division by 0)
		
		replace labor = labor_compensation
		replace capital = (`x'/100)*operating_surplus
		
		mkmat share_gdp, matrix(B) rownames(_varname) // matrix B of gdp shares
		mkmat a* labor capital, matrix(A) rownames(_varname) // matrix A of costs
		mkmat cost_factor, matrix(C) rownames(_varname) // matrix C of cost factors
		
		mat Omega = (A'*diag(C))' // divides elements of A by appropriate industry cost factor to create shares
		mat Ident = I(colsof(Omega)) // Identity matrix matching dimension of Omega
		mat L = inv(Ident - Omega) // Leontief inverse
		mat Lambda = B'*L // Cost shares
		mat Shares = [Lambda["share_gdp","labor"],Lambda["share_gdp","capital"]]
		mat colnames Shares = io_labor`x' io_capital`x'
		mat YearResult = YearResult,Shares
	}

	if `j' == 1 { // if 1st time through
		mat Results = YearResult // initialize results with first years results
	}
	else {
		mat Results = Results\YearResult // append year results to existing results
	}
	local j = `j' + 1
	
	} // end quietly
}

// Show and save results of calculations
mat list Results
clear
svmat Results, names(col)
save "./Work/BEA-io-cost-share.dta", replace

use "./Work/KLEMS-cost-share.dta", clear
keep if country=="US"
merge 1:1 year using "./Work/BEA-io-cost-share.dta"

drop if io_labor50==.

label variable shareLAB "KLEMS raw share"
label variable io_labor100 "I/O wtd. share (100% RK)"
label variable io_labor75 "I/O wtd. share (75% RK)"
label variable io_labor50 "I/O wtd. share (50% RK)"

line shareLAB io_labor100 io_labor75 io_labor50 year ///
	,xlabel(1995(5)2015 2018) ylabel(0(.1)1, format(%9.1f)) ytitle("Labor cost share") ///
	xtitle("Year")
graph export "./Drafts/notes-io-cost-shares.eps", replace as(eps)		
