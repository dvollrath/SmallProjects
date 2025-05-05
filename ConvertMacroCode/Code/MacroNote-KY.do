insheet using "./Data/bea_priv_assets.csv", names clear

gen ky = 1000*curr_cost_priv/gdp
label variable ky "Aggregate capital"

gen ky_equip = 1000*curr_cost_equip/gdp
gen ky_nonres = 1000*curr_cost_struct_nonres/gdp
gen ky_res = 1000*curr_cost_struct_res/gdp
gen ky_ip = 1000*curr_cost_ip/gdp

label variable ky_equip "Equipment"
label variable ky_nonres "Non-res. structures"
label variable ky_res "Residential structures"
label variable ky_ip "Intellectual property"

drop if year<1950

line ky ky_res ky_nonres ky_equip ky_ip year ///
	, ytitle("Capital/output ratio") xtitle("Year") xlabel(1950(10)2020) ylabel(0(.2)2.6, format(%5.1f) nogrid)
graph export "./Drafts/notes-ky-us.eps", replace as(eps)		

