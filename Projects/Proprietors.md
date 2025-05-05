# Proprietors income

This project is to work on an extension of the data I used in a paper on the United States. You can see the paper [here](https://growthecon.com/assets/Elasticity-Master.pdf).

The core idea is that I want to estimate the elasticity of GDP with respect to capital (and implicitly, to labor). That is, if I raise the capital stock by 1%, how much would GDP go up? Without getting into the details, by using a little theory we can in principle back this elasticity out from observable macro data. The use of this number is that it tells us a lot about how economies respond to shocks (if the elasticity is high then shocks dissipate very slowly, and vice versa) and grow (if the elasticity is high then building capital raises incomes a lot, and vice versa). 

But to do this calculation we have to know something about how the overall revenues of an industry are expended by that industry. Simply put, the revenues of an industry go to either (1) purchase intermediate inputs (e.g. car manufacturers buy steel or aluminum), (2) pay for labor (wages, etc..), (3) pay for capital services (e.g. renting a building, buying a machine), or (4) economic profits (not the accounting profits on an income statement). Economic profits are additional revenue earned by the industry because they have some market power; think of a monopoly, they get to charge more than marginal cost, and that additional revenue is an economic profit.

The data problem is that it’s hard to distinguish in the data between (2), (3), and (4). We can mostly measure wages, but normal accounting doesn’t distinguish between payments for capital and economic profits (or between payments to labor that are implicit, like a law partner getting payments for owning the firm). 

In the U.S., there is something reported for each industry called “Proprietor’s income”, which is like those payments to lawyers who own a law firm. A restaurant owner’s income from their restaurant would also be proprietor’s income. Some of that is labor income, some of that is economic profit. But if we at least know how big proprietor’s income is, we can at least get some information to help break down revenues. 

My problem is that internationally, most countries don’t report “Proprietor’s income” clearly. You can go to the [OECD data explorer](https://data-explorer.oecd.org) and search for “Proprietor” and get nothing. 

But I think a lot of countries do have data on something like this. I just don’t know what they call it, and finding the data may require reading some national accounting manual that is likely in a different language. 

So what I’m looking for someone to do is this:

1. For each country in the OECD, try and identify if they have explicit data for proprietor’s income (or whatever they call it)
  - I want this data at the industry level. You’ll see these industries categorized by something called either NAICS codes, SIC codes, or ISIC codes. (“Agriculture”, “Metal manufacturing”, “Communication Services”)
  - I want this data for as many years as possible. Most likely we can get it for something like 1995-2019-ish. For obvious reasons getting 2020 and later data isn’t necessary because who knows what COVID did to things.
  - The OECD data explorer doesn’t have it, but can provide clues to where to look? You might have to hunt through and try and find what industry-level data they *do* have, and then we can talk about what might work, or how that might point towards sources.
2. Most likely, this will involve looking at individual country statistical agency sites and searching/googling/hunting/reading looking for something equivalent to “Proprietor’s Income”. 
  - You can look for things like “self-employment” but note that we need information on total self-employed income, not number of self-employed workers. 
  - This probably involves Google Translating (or whatever tool you use) sites or manuals. For obvious reasons that might be imperfect. If we find good ideas, then we might push those to language experts to confirm. 
  - It’s possible these countries just don’t track this kind of information. It’s possible we’ll get something *like* proprietor’s income, but that doesn’t match the US definition exactly. That’s okay, I just want to know what’s available. 
3. The end product of this would be (ideally)
  - a set of spreadsheets or data files that have measures of proprietor’s income, by country, by industry, by year. That is, each row or observation is like “Denmark, Hotels and accommodations, 1998, xxxxx” where xxxx is some measure of prop income. I have all the other industry level stuff I need. 
  - Documentation on the definition of prop income for that country, and the source info to go find it. 
