cd "/users/dietz/dropbox/project/macronotes"

//capture net install gr0070.pkg // plotplain figure scheme
//capture ssc install egenmore // some additional data commands

// Set options for formatting of figures
graph set window fontface "Garamond"
set scheme plotplain

use "./Data/pwt91_na_data.dta", clear

drop if year<1950 | year>2015
egen id = group(countrycode)
xtset id year


gen p_i = (v_i/q_i)/(v_c/q_c)

line p_i year if countrycode=="USA" ///
	|| line p_i year if countrycode=="GBR" ///
	|| line p_i year if countrycode=="CAN" ///
	|| line p_i year if countrycode=="AUS" ///
	|| line p_i year if countrycode=="MEX" ///
	,  xlabel(1950(10)2010 2015) ylabel(, format(%9.1f)) xtitle("Year") ytitle("Relative price of investment to consumption") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))
graph export "./Drafts/notes-pinv-bgp.eps", replace as(eps)		
	
line p_i year if countrycode=="USA" ///
	|| line p_i year if countrycode=="DEU" ///
	|| line p_i year if countrycode=="JPN" ///
	|| line p_i year if countrycode=="CHN" ///
	|| line p_i year if countrycode=="NGA", clcolor(black) ///
	,  xlabel(1950(10)2010 2015) ylabel(, format(%9.1f)) xtitle("Year") ytitle("Relative price of investment to consumption") ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "China") label(5 "Nigeria"))
graph export "./Drafts/notes-pinv-catchup.eps", replace as(eps)		

gen scon = v_c/v_gdp

line scon year if countrycode=="USA" ///
	|| line scon year if countrycode=="GBR" ///
	|| line scon year if countrycode=="CAN" ///
	|| line scon year if countrycode=="AUS" ///
	|| line scon year if countrycode=="MEX" ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Consumption share of GDP") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))
graph export "./Drafts/notes-scon-bgp.eps", replace as(eps)		

line scon year if countrycode=="USA" ///
	|| line scon year if countrycode=="DEU" ///
	|| line scon year if countrycode=="JPN" ///
	|| line scon year if countrycode=="KOR" ///
	|| line scon year if countrycode=="CHN" ///
	|| line scon year if countrycode=="NGA", clcolor(black) ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Consumption share of GDP") ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "South Korea") label(5 "China") label(6 "Nigeria"))
graph export "./Drafts/notes-scon-catchup.eps", replace as(eps)		

gen sinv = v_i/v_gdp

line sinv year if countrycode=="USA" ///
	|| line sinv year if countrycode=="GBR" ///
	|| line sinv year if countrycode=="CAN" ///
	|| line sinv year if countrycode=="AUS" ///
	|| line sinv year if countrycode=="MEX" ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Gross cap formation share of GDP") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))
graph export "./Drafts/notes-sinv-bgp.eps", replace as(eps)		

line sinv year if countrycode=="USA" ///
	|| line sinv year if countrycode=="DEU" ///
	|| line sinv year if countrycode=="JPN" ///
	|| line sinv year if countrycode=="KOR" ///
	|| line sinv year if countrycode=="CHN" ///
	|| line sinv year if countrycode=="NGA", clcolor(black) ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Gross cap formation share of GDP") ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "South Korea") label(5 "China") label(6 "Nigeria"))
graph export "./Drafts/notes-sinv-catchup.eps", replace as(eps)		

merge 1:1 countrycode year using "./Data/pwt91.dta", keep(match master)
capture drop id
egen id = group(countrycode)
xtset id year

capture drop lny
gen lny = ln(rgdpna/pop)

binscatter sinv lny, nquantiles(100) line(none) ///
	xtitle("(log) real GDP per capita") ytitle("Investment share of GDP") ylabel(0(0.1).5, format(%9.1f)) 
graph export "./Drafts/notes-sinv-lny.eps", replace as(eps)		

	
gen g10 = (F10.lny - lny)/10
scatter g10 sinv if countrycode=="USA" ///
	|| scatter g10 sinv if countrycode=="JPN" ///
	|| scatter g10 sinv if countrycode=="DEU" ///
	|| scatter g10 sinv if countrycode=="CHN" ///
	|| scatter g10 sinv if countrycode=="KOR" ///
	|| scatter g10 sinv if countrycode=="NGA" ///
	, xtitle("10-year average growth rate") ytitle("Investment share of GDP") ylabel(, format(%9.1f)) ///
	legend(label(1 "United States") label(2 "Japan") label(3 "Germany") label(4 "China") label(5 "South Korea") label(6 "Nigeria"))

by id: egen year_min = min(year)

gen qinv = q_i/q_gdp
gen K = .
replace K = q_gdp*qinv/(.02+.01+.05) if year==year_min
replace K = (1-.05)*L.K + q_i if year>year_min

gen ky = K/q_gdp

line ky year if countrycode=="USA" ///
	|| line ky year if countrycode=="GBR" ///
	|| line ky year if countrycode=="CAN" ///
	|| line ky year if countrycode=="AUS" ///
	|| line ky year if countrycode=="MEX" ///
	,  xlabel(1950(10)2010 2015) xtitle("Year") ytitle("Capital/output ratio") ylabel(0(1)6, nogrid) ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))
graph export "./Drafts/notes-ky-bgp.eps", replace as(eps)		

line ky year if countrycode=="USA" ///
	|| line ky year if countrycode=="DEU" ///
	|| line ky year if countrycode=="JPN" ///
	|| line ky year if countrycode=="KOR" ///
	|| line ky year if countrycode=="CHN" ///
	|| line ky year if countrycode=="NGA", clcolor(black) ///
	,  xlabel(1950(10)2010 2015) xtitle("Year") ytitle("Capital/output ratio")  ylabel(0(1)6, nogrid) ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "South Korea") label(5 "China") label(6 "Nigeria"))
graph export "./Drafts/notes-ky-catchup.eps", replace as(eps)	

drop _merge
rename countrycode iso
merge 1:1 iso year using "./Data/JSTDatasetR4.dta", keepusing(cpi housing_tr eq_tr safe_tr risky_tr capital_tr)

sort id year
gen pi = (cpi-L.cpi)/L.cpi
gen housing_real = (1+housing_tr)/(1+pi) - 1
gen eq_real = (1+eq_tr)/(1+pi) - 1
gen safe_real = (1+safe_tr)/(1+pi) - 1
gen risky_real = (1+risky_tr)/(1+pi) - 1
gen capital_real = (1+capital_tr)/(1+pi) - 1

binscatter eq_real ky, nquantile(100) absorb(iso) control(i.year) ///
	xtitle("Capital/output ratio") ytitle("Rate of return on equities")
graph export "./Drafts/notes-ky-return-eq.eps", replace as(eps)

binscatter housing_real ky, nquantile(100) absorb(iso) control(i.year) ///
	xtitle("Capital/output ratio") ytitle("Rate of return on housing")
graph export "./Drafts/notes-ky-return-housing.eps", replace as(eps)

binscatter capital_real ky, nquantile(100) absorb(iso) control(i.year) ///
	xtitle("Capital/output ratio") ytitle("Rate of return on capital")
graph export "./Drafts/notes-ky-return-capital.eps", replace as(eps)
