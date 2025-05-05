# Convert code for macro notes
I have a set of Stata code, and data, I wrote that produces figures I use in a PhD macro course (and for other purposes). Because it's in Stata it is not accessible to everyone, and I want to convert this to R. 

## The basic job
The folder for this already contains code, and the data folder contains the data. The object of this project is to write matching R scripts that do the same thing as the Stata scripts. 

## Picky parts
For producing the figures in R I want you to use Plotly, a package that formats and writes figures. ggPlot is a standard, but doesn't allow for some of the things I want. 

1. Each figure from the Stata code should be replicated and use Plotly to produce a PDF figure.
2. In addition, each figure should be replicated and then saved as an HTML widget that can be used on a website. 
  - This is handled with the "htmlwidgets" package
  - A working example of this is also contained in the Code folder (the R script)
3. There should be a "Master" R script that
  - Loads required packages and sets the working directory
  - Calls sub-scripts that load data and produce figures

## Data retrieval
In R there are some packages that will read some of this data directly (the pwt package, for example). To the extent possible, the new R code should use those retrieval methods rather than relying on a fixed file in the Data folder. That will make these figures "live" and easy to update.