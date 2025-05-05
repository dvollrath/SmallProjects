cd "/users/dietz/dropbox/project/macronotes"

use "./Data/JSTDatasetR4.dta", clear

xtset ifs year

gen bin = 0
local i = 1
forvalues y = 1870(5)2015 {
	replace bin = `i' if inrange(year,`y',`y'+4)
	local i = `i' + 1
}

gen pi = (cpi-L.cpi)/L.cpi
gen housing_real = (1+housing_tr)/(1+pi) - 1
gen eq_real = (1+eq_tr)/(1+pi) - 1
gen safe_real = (1+safe_tr)/(1+pi) - 1


binscatter housing_real eq_real safe_real year if iso=="USA", ///
	xq(bin) xlabel(1890(10)2020) line(connect) ylabel(-.2(.1).4) ///
	xtitle("Year") ytitle("5-year mean rate of return") ///
	legend(label(1 "Housing") label(2 "Equities") label(3 "Govt bonds"))
graph export "./Drafts/notes-return-usa.eps", replace as(eps)	

binscatter housing_real eq_real safe_real year if iso=="JPN", ///
	xq(bin) xlabel(1930(10)2020) line(connect) ylabel(-.2(.1).4) ///
	xtitle("Year") ytitle("5-year mean rate of return") ///
	legend(label(1 "Housing") label(2 "Equities") label(3 "Govt bonds"))
graph export "./Drafts/notes-return-jpn.eps", replace as(eps)		
		
binscatter housing_real eq_real safe_real year if iso=="GBR", ///
	xq(bin) xlabel(1890(10)2020) line(connect) ylabel(-.2(.1).4) ///
	xtitle("Year") ytitle("5-year mean rate of return") ///
	legend(label(1 "Housing") label(2 "Equities") label(3 "Govt bonds"))
graph export "./Drafts/notes-return-gbr.eps", replace as(eps)		

binscatter housing_real eq_real safe_real year if iso=="DEU", ///
	xq(bin) xlabel(1870(10)2020) line(connect) ylabel(-.2(.1).4) ///
	xtitle("Year") ytitle("5-year mean rate of return") ///
	legend(label(1 "Housing") label(2 "Equities") label(3 "Govt bonds"))
graph export "./Drafts/notes-return-deu.eps", replace as(eps)		
