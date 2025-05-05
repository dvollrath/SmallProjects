# Family structure
What I have in mind is studying the determinants of family structure across developing economies. By family structure I mean things like: do households tend to have 2 or 3 generations? If 3, who is the “head”, the eldest or the middle generation? Do married children reside with parents? If so, is the brides or the grooms parents? And so on. 

These family structures are kind of the raw evidence of how different areas/cultures organize family life, and one strand of recent literature has emphasized how the cultural aspects of families (clans versus nuclear, etc..) related to economic development through things like trust and risk-aversion. So I *think* what I want to do is look at some determinants of family structure to see (1) do common sources that describe different cultural attitudes towards family actually lead to differences in family structure? (2) in addition to the cultural attitudes are there geographic determinants, like type of agriculture, and (3) how much of variation in family structure is simply due to things like urbanization and economic development. Those three questions may not all be very coherent together. 

Regardless, to do this I already have pulled down a bunch of individual surveys from the Demographic and Health Surveys, which has info on who resides in a household. From that raw data you can create measures of things like number of generations in a household, and is the head the eldest, etc.. 

I want to do the same kind of things with the broad cross-section of census data available on IPUMS. Those censuses typically have the same kind of information allowing you to measure family structure (it’s one of their purposes). The extra value of IPUMS is that it allows one to look backwards in time, as they have available a ton of older censuses for developed countries. This will make for some interesting comparisons with current developing countries. 

## Tasks
There are two primary tasks with this project
1. Identify what the family data fields are that are available in IPUMS
  - After this is done, contact me and we'll see what has to be in the download for #2
2. Download the census data for this family data
3. Basic analysis

# Identifying data
## IPUMS
[IPUMS](https://www.ipums.org) is the website you need to visit. You’ll want to then visit the “IPUMS International” link on the main page. (In the future, IPUMS has a *ton* of additional data available on other subjects, so might be of interest). 

You’ll want to register first, as you have to do this to create extracts and get data from them. You’ll need to provide your name, institution, e-mail, and probably given them a short paragraph about what you are doing. You can hack something together out of what I gave you above. Don’t worry about it, they’ll approve as long as it sounds vaguely legitimate. 

## Harmonized Family Variables
Really the first steps are to figure out what common family variables we can get a hold of. Not all censuses record the same information, but IPUMS tries to rationalize across censuses so that you can get consistent measures. 

What I need first is for you to go through the various “Household” and “Person” sections to find specific variables that related to family relationships in a household and pull down descriptions of those variables so that we can decide what variables we want to ultimately use. Grab anything you think *might* be useful in terms of reconstructing family structure. Better to have too many that miss one.

I also need to know how available those variables are across different censuses. A cool variable that’s only available in Vietnam isn’t as interesting as one available across many countries, in this case. The variable list  gives you all the regular modern censuses. From that you can see which is available (it might be easier to record which censuses *don’t* have a variable). You might also be able to hunt around the IPUMS site and find like a central document you can download about variable availability across censuses.

I had someone start this a long time ago, so the spreadsheet in the project folder called VarOverview has some of what I want. You can check this against what IPUMS has already. 

# Downloading data
IPUMS allows you to make extracts of data from each census. Once you identify the variables and I decide which ones I want, the second part of this project is to do those extracts for all the possible census that have relevant data. 

This is the tedious part, as it involves going into IPUMS and requesting these variables from each census and having them do the extract. Those extracts then take a while to run and they notify you when it is ready to download. This will really just be working down the checklist.

The outcome of this won't fit into Github (they have storage limits). Once we reach this point I'll connect you with a Dropbox folder where those extracts can go. 



