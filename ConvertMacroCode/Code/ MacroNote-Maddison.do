// Open and use main Maddison data file
clear
use "./Data/maddison2010.dta"

keep if year>=1870
gen lnusa = ln(usa)
gen lnuk = ln(englandgbuk)
gen lngermany = ln(germany)
gen lnjapan = ln(japan)

label variable lnusa "United States"
label variable lnuk "United Kingdom"
label variable lngermany "Germany"
label variable lnjapan "Japan"

tsset year
local lag = 20
gen g`lag'usa = (lnusa - L`lag'.lnusa)/`lag'
gen g`lag'uk = (lnuk - L`lag'.lnuk)/`lag'
gen g`lag'germany = (lngermany - L`lag'.lngermany)/`lag'
gen g`lag'japan = (lnjapan - L`lag'.lnjapan)/`lag'

label variable g`lag'usa "United States"
label variable g`lag'uk "United Kingdom"
label variable g`lag'germany "Germany"
label variable g`lag'japan "Japan"


line lnusa year ///
	|| line lnuk year ///
	|| line lngermany year ///
	|| line lnjapan year /// 
	, xlabel(1870 1890 1910 1930 1950 1970 1990 2010) xtitle("Year") ytitle("Real per capita GDP (1990 dollars)") ///
	ylabel(6(1)11,nogrid)
graph export "./Drafts/notes-maddison-bgp.eps", replace as(eps)

drop if year<1870+`lag'

line g`lag'usa year ///
	|| line g`lag'uk year ///
	|| line g`lag'germany year ///
	|| line g`lag'japan year /// 
	, xlabel(1890 1910 1930 1950 1970 1990 2010) xtitle("Year") ytitle("20-year average growth rate") ///
	ylabel(-.02(.01).08, nogrid format(%5.2f))
graph export "./Drafts/notes-maddison-rate.eps", replace as(eps)	
