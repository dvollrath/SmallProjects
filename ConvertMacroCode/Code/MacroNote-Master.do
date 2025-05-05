cd "/users/dietz/dropbox/project/macronotes"

//capture net install gr0070.pkg // plotplain figure scheme
//capture ssc install egenmore // some additional data commands

// Set options for formatting of figures
graph set window fontface "Garamond"
set scheme plotplain

use "./Data/pwt91.dta", clear

drop if year<1960 | year>2015
egen id = group(countrycode)
xtset id year

gen ky = rnna/rgdpna

line ky year if countrycode=="USA" ///
	|| line ky year if countrycode=="GBR" ///
	|| line ky year if countrycode=="CAN" ///
	|| line ky year if countrycode=="AUS" ///
	|| line ky year if countrycode=="MEX" ///
	,  xlabel(1970(10)2010 2015) xtitle("Year") ytitle("Capital/output ratio") ylabel(0(1)6, nogrid) ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))

line ky year if countrycode=="USA" ///
	|| line ky year if countrycode=="DEU" ///
	|| line ky year if countrycode=="JPN" ///
	|| line ky year if countrycode=="KOR" ///
	|| line ky year if countrycode=="CHN" ///
	|| line ky year if countrycode=="NGA", clcolor(black) ///
	,  xlabel(1970(10)2010 2015) xtitle("Year") ytitle("Capital/output ratio") ylabel(0(1)6, nogrid) ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "Korea") label(5 "China") label(6 "Nigeria"))


gen lnpli = ln(pl_i)
line lnpli year if countrycode=="USA" ///
	|| line lnpli year if countrycode=="GBR" ///
	|| line lnpli year if countrycode=="CAN" ///
	|| line lnpli year if countrycode=="AUS" ///
	|| line lnpli year if countrycode=="MEX" ///
	, xlabel(1950(10)2010 2015) ylabel(,nogrid) xtitle("Year") ytitle("Log relative price investment") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))

gen lnpop = ln(pop)
line lnpop year if countrycode=="USA" ///
	|| line lnpop year if countrycode=="GBR" ///
	|| line lnpop year if countrycode=="CAN" ///
	|| line lnpop year if countrycode=="AUS" ///
	|| line lnpop year if countrycode=="MEX" ///
	, xlabel(1950(10)2010 2015) ylabel(,nogrid) xtitle("Year") ytitle("Log real GDP per capita") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))

gen g10pop = (lnpop - L10.lnpop)/10
line g10pop year if countrycode=="USA" ///
	|| line g10pop year if countrycode=="GBR" ///
	|| line g10pop year if countrycode=="CAN" ///
	|| line g10pop year if countrycode=="AUS" ///
	|| line g10pop year if countrycode=="MEX" ///
	, xlabel(1950(10)2010 2015) ylabel(,nogrid) xtitle("Year") ytitle("Log real GDP per capita") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))

line g10pop year if countrycode=="USA" ///
	|| line g10pop year if countrycode=="DEU" ///
	|| line g10pop year if countrycode=="JPN" ///
	|| line g10pop year if countrycode=="KOR" ///
	|| line g10pop year if countrycode=="CHN" ///
	|| line g10pop year if countrycode=="NGA", clcolor(black) ///
	, xlabel(1950(10)2010 2015) ylabel(,nogrid) xtitle("Year") ytitle("Log real GDP per capita") ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "South Korea") label(5 "China") label(6 "Nigeria"))
	
	
gen lny = ln(rgdpna/pop)

line lny year if countrycode=="USA" ///
	|| line lny year if countrycode=="GBR" ///
	|| line lny year if countrycode=="CAN" ///
	|| line lny year if countrycode=="AUS" ///
	|| line lny year if countrycode=="MEX" ///
	, xlabel(1950(10)2010 2015) ylabel(6(1)11) xtitle("Year") ytitle("Log real GDP per capita") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))
graph export "./Drafts/notes-lny-bgp.eps", replace as(eps)		

line lny year if countrycode=="USA" ///
	|| line lny year if countrycode=="DEU" ///
	|| line lny year if countrycode=="JPN" ///
	|| line lny year if countrycode=="KOR" ///
	|| line lny year if countrycode=="CHN" ///
	|| line lny year if countrycode=="NGA", clcolor(black) ///
	,  xlabel(1950(10)2010 2015) ylabel(6(1)11) xtitle("Year") ytitle("Log real GDP per capita") ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "South Korea") label(5 "China") label(6 "Nigeria"))
graph export "./Drafts/notes-lny-catchup.eps", replace as(eps)		


line labsh year if countrycode=="USA" ///
	|| line labsh year if countrycode=="GBR" ///
	|| line labsh year if countrycode=="CAN" ///
	|| line labsh year if countrycode=="AUS" ///
	|| line labsh year if countrycode=="MEX" ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Labor share of output") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))
graph export "./Drafts/notes-labshare-bgp.eps", replace as(eps)		

line labsh year if countrycode=="USA" ///
	|| line labsh year if countrycode=="DEU" ///
	|| line labsh year if countrycode=="JPN" ///
	|| line labsh year if countrycode=="KOR" ///
	|| line labsh year if countrycode=="CHN" ///
	|| line labsh year if countrycode=="NGA", clcolor(black) ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Labor share of output") ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "South Korea") label(5 "China") label(6 "Nigeria"))
graph export "./Drafts/notes-labshare-catchup.eps", replace as(eps)		
	
gen scon = rconna/rgdpna

line csh_c year if countrycode=="USA" ///
	|| line csh_c year if countrycode=="GBR" ///
	|| line csh_c year if countrycode=="CAN" ///
	|| line csh_c year if countrycode=="AUS" ///
	|| line csh_c year if countrycode=="MEX" ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Consumption share of GDP") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))
graph export "./Drafts/notes-scon-bgp.eps", replace as(eps)		

line csh_c year if countrycode=="USA" ///
	|| line csh_c year if countrycode=="DEU" ///
	|| line csh_c year if countrycode=="JPN" ///
	|| line csh_c year if countrycode=="KOR" ///
	|| line csh_c year if countrycode=="CHN" ///
	|| line csh_c year if countrycode=="NGA", clcolor(black) ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Consumption share of GDP") ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "South Korea") label(5 "China") label(6 "Nigeria"))
graph export "./Drafts/notes-scon-catchup.eps", replace as(eps)		

line csh_i year if countrycode=="USA" ///
	|| line csh_i year if countrycode=="GBR" ///
	|| line csh_i year if countrycode=="CAN" ///
	|| line csh_i year if countrycode=="AUS" ///
	|| line csh_i year if countrycode=="MEX" ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Gross capital formation share of GDP") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "Canada") label(4 "Australia") label(5 "Mexico"))
graph export "./Drafts/notes-cshi-bgp.eps", replace as(eps)		

line csh_i year if countrycode=="USA" ///
	|| line csh_i year if countrycode=="DEU" ///
	|| line csh_i year if countrycode=="JPN" ///
	|| line csh_i year if countrycode=="KOR" ///
	|| line csh_i year if countrycode=="CHN" ///
	|| line csh_i year if countrycode=="NGA", clcolor(black) ///
	,  xlabel(1950(10)2010 2015) ylabel(0(.1)1, format(%9.1f)) xtitle("Year") ytitle("Gross capital formation share of GDP") ///
	legend(label(1 "United States") label(2 "Germany") label(3 "Japan") label(4 "South Korea") label(5 "China") label(6 "Nigeria"))
graph export "./Drafts/notes-cshi-catchup.eps", replace as(eps)		

gen g5 = (F5.lny - lny)/5
gen g10 = (F10.lny - lny)/10
gen g20 = (F20.lny - lny)/20

scatter g10 lny if countrycode=="USA" ///
	|| scatter g10 lny if countrycode=="JPN" ///
	|| scatter g10 lny if countrycode=="DEU" ///
	|| scatter g10 lny if countrycode=="CHN" ///
	|| scatter g10 lny if countrycode=="KOR" ///
	|| scatter g10 lny if countrycode=="NGA" ///
	, xtitle("Initial (log) real GDP per capita") ytitle("10-year average growth rate") ylabel(-.03(.01).1, format(%9.2f)) ///
	legend(label(1 "United States") label(2 "Japan") label(3 "Germany") label(4 "China") label(5 "South Korea") label(6 "Nigeria"))
graph export "./Drafts/notes-g10-all.eps", replace as(eps)		




//binscatter g5 g10 g20 lny if lny<=11, nquantiles(100) line(qfit)
