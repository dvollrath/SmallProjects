# Spatial distribution of activity
What I’m after here is getting data for an overview of the characteristics of where different industries locate. For example, lots of car plants are located in southern counties that are not terribly urbanized. These places are set in quasi-rural areas (because land is cheaper, etc..)

The larger question I’m after is whether there are clear patterns such that manufacturing locates in relatively low density, kinda-sorta suburban/rural areas outside of major cities, while services (lawyers, restaurants, etc..) are more likely located in high density, more urban areas inside major cities. This ultimately is going to inform us on whether structural change (the shift of economic activity into services) is part of the reason why rents for buildings have risen faster than normal over the recent past. There’s some more logic behind this, but that’s kind of what I’m thinking now. 

I know the BEA does data by county, [here](https://www.bea.gov/data/by-place-county-metro-local)

I just haven’t spent a lot of time looking through it to figure out what it has. I’m after information about industry activity (employees and value-added) in each county over time. Separately, I’d want info on county demographics and other features to compare to. That county level demographic stuff likely is available via the [Census website](https://www.census.gov/data.html).

US data sources are usually pretty good, so this involves a lot of just clicking around to see what they have. 

The end product of this would be something like:
1. One data file that is organized by county/year (e.g. Harris county in 2002, Harris county in 2003, etc.) with 
  - Population data of that county
  - Whether that county is part of a larger MSA (these are metro statistical areas, a common term in US national accounts). 
  - Kind of any other basic demographics or econ data that is easily found (GDP by county is now available, maybe some age distributions?)
2. A second data file that is organized by something like county/industry/year
  - Each row would tell us something like, for the telecoms industry in Harris county in 2005, how many workers were there in that industry, and how big was economic output (value-added) for that industry. 
3. Source information both both kinds of files. 
4. A bonus would be if Census has information on business statistics (business starts, business exits, for example) by county and *also* by industry. 

Phase 2
1. Gather all the establishment data for all years
  - That will have a gap from like 2008-12, as noted already. That’s fine.
  - Each year should be saved as a separate CSV file
  - Each year should have the FIPS codes for each county attached. These can be found [here:](https://www.census.gov/geographies/reference-files/2020/demo/popest/2020-fips.html)
  - Check the establishment data source, it may have FIPS already in it? Just need to add that column to the download?
  - I only need total establishments, total payroll, and total employees. I don’t need breakdowns (e.g. # establishment 10-19, etc.)
2. Merging. The ultimate thing I need are files that shows me (at a minimum)
  - FIPS, county name, industry, # establishments, employees, payroll
  - FIPS, county name, population, personal income
