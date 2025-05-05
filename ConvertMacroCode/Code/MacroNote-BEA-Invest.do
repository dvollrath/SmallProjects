cd "/users/dietz/dropbox/project/macronotes"

import excel using "./Data/Section1All_xls.xlsx", clear sheet("T10104-A") cellrange(A9:CO21)
local year = 1929
foreach x of varlist D-CO {
	rename `x' v`year'
	local year = `year' + 1
}
keep if inlist(C,"A191RG","DPCERG","B006RG","B009RG","Y033RG","Y001RG","B011RG")
gen dvcode = ""
replace dvcode = "GDP" if C=="A191RG"
replace dvcode = "PCE" if C=="DPCERG"
replace dvcode = "INV" if C=="B006RG"
replace dvcode = "NONSTRUCT" if C=="B009RG"
replace dvcode = "NONEQUIP" if C=="Y033RG"
replace dvcode = "NONIP" if C=="Y001RG"
replace dvcode = "RESID" if C=="B011RG"

reshape long v, i(dvcode) j(year)
drop A B C
reshape wide v, i(year) j(dvcode) string

foreach x in INV NONSTRUCT NONEQUIP NONIP RESID {
	qui gen rel`x' = v`x'/vPCE
	qui summ rel`x' if year==1929
	local base = r(mean)
	replace rel`x' = 100*rel`x'/`base'
}

label variable relINV "Investment"
label variable relNONSTRUCT "Non-res. structures"
label variable relRESID "Res. structures"
label variable relNONEQUIP "Equipment"
label variable relNONIP "Intel. prop."

line relINV relNONSTRUCT relRESID relNONEQUIP relNONIP year, ///
	xtitle("Year") ytitle("Price relative to consumption") xlabel(1930(10)2020)
graph export "./Drafts/notes-inv-prices.eps", replace as(eps)		
	
