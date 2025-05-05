freduse ///
GPDI /// nominal investment
GDPA /// nominal GDP
PCE /// nominal consumption
, clear

gen year = year(daten) // extract year

rename GPDI I
rename GDPA Y
rename PCE C

gen IY = I/Y
gen CY = C/Y
