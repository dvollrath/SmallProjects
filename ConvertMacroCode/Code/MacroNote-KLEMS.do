cd "/users/dietz/dropbox/project/macronotes"

import excel using "./Data/KOREA-Basic File_2015(revised_160205)", clear firstrow sheet("LAB")
drop desc industry
rename Code code
gen country = "KOR"
gen var = "LAB"
save "./Work/KLEMS-Korea-LAB.dta", replace

import excel using "./Data/KOREA-Basic File_2015(revised_160205)", clear firstrow sheet("CAP")
drop desc industry
rename Code code
gen country = "KOR"
gen var = "CAP"
save "./Work/KLEMS-Korea-CAP.dta", replace

import excel using "./Data/KOREA-Basic File_2015(revised_160205)", clear firstrow sheet("CAP_QI")
drop desc industry
rename Code code
gen country = "KOR"
gen var = "CAP_QI"
save "./Work/KLEMS-Korea-CAPQI.dta", replace

insheet using "./Data/ALL_output_17ii.txt", clear comma

append using "./Work/KLEMS-Korea-LAB.dta"
append using "./Work/KLEMS-Korea-CAP.dta"
append using "./Work/KLEMS-Korea-CAPQI.dta"

keep if inlist(var,"LAB","CAP","CAP_QI")
keep if inlist(code,"TOT")

reshape long _, i(country var) j(year)
rename _ cost
reshape wide cost, i(country year) j(var) string

gen shareLAB = costLAB/(costLAB+costCAP)

save "./Work/KLEMS-cost-share.dta", replace

drop if year<1980

line shareLAB year if country=="UK" ///
	|| line shareLAB year if country=="US" ///
	|| line shareLAB year if country=="FR" ///
	|| line shareLAB year if country=="DE" ///
	|| line shareLAB year if country=="KOR" ///
	, ylabel(0(.1)1, format(%9.1f)) ytitle("Labor share of total costs") ///
	xlabel(1980(10)2010 2015) xtitle("Year") ///
	legend(label(1 "United States") label(2 "United Kingdom") label(3 "France") label(4 "Germany") label(5 "South Korea"))

