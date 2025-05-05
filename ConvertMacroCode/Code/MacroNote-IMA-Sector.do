cd "/users/dietz/dropbox/project/macronotes"

import excel using "./Data/IMA-TS2-A.xlsx", clear sheet("Sheet1") cellrange(A3:CL62) firstrow

destring year, replace

gen p_netsave_i = LA000121/LA000217
gen p_netsave_hh_i = A071RC/LA000217
gen p_netsave_nfcb_i = LA000123/LA000217
gen p_netsave_finb_i = LA000122/LA000217
gen p_netsave_fgov_i = A923RC/LA000217
gen p_netsave_sgov_i = A924RC/LA000217

line p_netsave* year

gen r_netsave_hh_worth = A071RC/FL152090005

gen networth_tot = FL152090005 + LM112090205 + FL102090085 + FL792090095 + FL312090095 + FL212090095 + FL262090095

gen r_netsave_networth = LA000121/networth_tot
gen r_inv_networth = LA000217/networth_tot
gen r_depr_networth = A262RC/networth_tot
gen r_netlend_networth = LA000137/networth_tot

line r_inv_networth r_netsave_networth r_depr_networth r_netlend_networth year

gen r_inv_va = LA000217/A261RC
line r_inv_va year, ylabel(0(.1)1)

drop r_diff
gen r_diff = r_inv_networth - r_depr_networth - r_netsave_networth + r_netlend_networth
line r_diff year


tsset year

gen dnetworth = FC152090005 + FC112090205 + FC102090085 + FC792090095 + FC312090095 + FC212090095 + FC262090095
gen r_dworth_networth = dnetworth/L.networth_tot

line r_dworth_networth year

gen holdgain = FR158200095 +FR112010005+FR108200005+FR798200005+FR318200005+FR218200005+FR265000005
gen r_holdgain_networth = holdgain/L.networth_tot
line r_holdgain_networth year

gen addworth = dnetworth - holdgain
gen r_addworth_networth = addworth/L.networth_tot
line r_dworth_networth r_addworth_networth r_holdgain_networth year

line r_addworth_networth r_inv_networth year

gen p_netsave_dnetworth = LA000121/dnetworth
line p_netsave_dnetworth year

gen wealth_output = networth_tot/A261RC
line wealth_output year

gen hh_wealth_output = FL152090005/A261RC
line hh_wealth_output year

gen hh_gov_sources = A071RC + A923RC + A924RC + W279RC + A918RC + A919RC
gen biz_sources = LA000123 + LA000122 + LA000074 + B456RC + LA000073
gen hh_gov_uses = W988RC + A787RC + A799RC
gen biz_uses = LA000109 + LA000108 + LA000107

gen hh_gov_use_inv = hh_gov_uses/LA000217
gen biz_use_inv = biz_uses/LA000217

line hh_gov_use_inv biz_use_inv year

gen hh_gov_source_inv = hh_gov_sources/LA000217
gen biz_source_inv = biz_sources/LA000217

line hh_gov_source_inv biz_source_inv year

gen hh_sources = A071RC + W279RC
gen hh_uses = W988RC

gen hh_source_inv = hh_sources/LA000217
gen hh_uses_inv = hh_uses/LA000217

line hh_source_inv hh_uses_inv year

gen gov_source_inv = (A923RC + A924RC + A918RC + A919RC)/LA000217
gen gov_uses_inv = (A787RC + A799RC)/LA000217

line gov_source_inv gov_uses_inv year

line biz_source_inv biz_use_inv hh_source_inv hh_uses_inv gov_source_inv gov_uses_inv year
