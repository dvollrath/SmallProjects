# Small Projects
This repository contains information and prompts for people working on research projects for me. In general these are "summer projects". This repository is public and multiple people working on projects for me will be interacting with it at any given time. 

If you are interested in working on a project, then you need only sign up (see next sub-section), assign yourself one of the "Issues", and get to it. 

The terms of this are very hands off from my perspective. I do not have the time to do careful coaching of anyone through these summer projects. These are entirely self-driven. See below for how to communicate questions or issues about the project to me. 

If you complete a substantial set of work on one of the projects, I will be happy to discuss what kind of help I can give you going forward. Often that includes a reference letter for undergrad, grad, or post-doc positions. We will work together on that so I know what kind of information will be helpful to you and can ask questions I might need answers to so that I can write the best possible letter. 

## Projects as issues
Each project I'm interested in is tracked as an "Issue" in Github. If you are going to work on one, you'll need to:

1. Have a Github account. You can sign up for one for free. 
2. E-mail me your Github username, and I will add you as a collaborator on the repository. 
3. Once you are a collaborator you should have the ability to assign yourself to an Issue

Each of those Issues should have a folder with an obvious matching name in the repository. That's where all the work on this issue should go.

## Local work and pull requests
When you have decided to work on a project you should clone or download the repository to your local computer. Work on it there, add files, write your code, etc. 

When you have a substantial set of work done that I can look at:
1. Go back to the Issue and leave a comment on it that you think you're done or at a major checkpoint.
2. In Github, issue a "Pull Request" for your local code. That will alert me that it's ready for review. I can then check it over and approve it if we're good. When I approve it, it will get copied into the main repository. 

## Working on the same project
I don't have a problem with multiple people working on a given project. The coordination of that work is up to those people, and it doens't require you to collaborate unless you want to. But you will need to do some minimal coordination to ensure your code and data files do not copy over or delete other's work. 

To be clear, *this is not a competition*. If multiple people work on the same project there will be some duplication of effort, sure, but there will likely be insights that each person has that benefit everyone. I would encourage you to look at each other's work and learn from it: *This is how actual research works*. 

I have no problem accepting work from multiple people on these projects, and will happily write a reference letter (or whatever you need) for each person. I'd rather have you working on something that interests you than taking on boring work worried about competing with others. 

## Communication and questions
All questions or comments on your project should go through your "Issue" in Github. You can leave comments there and I'll get notified. You can/should leave links, working examples, or copies of files that clarify your question.

I get notified of the comments, and I'll reply in the Issue itself. I don't monitor this continuously, so it is likely to be several days before I reply. 

In general, trust yourself. There are no clear "right answers" for these projects. The most important thing is that you keep clear documentation of what you did (both in the code, and possibly in a write-up) so that we can replicate it, see whether it works, and modify if necessary. 

I hate Zoom, so my preference is that we communicate via the Issues on Github. If we get very stuck on something we might need to talk directly, but my goal is to avoid this unless necessary. I know that sounds kind of cold, but that is how I roll on these. It also ensures all the questions and answers we have are documented and don't need to be answered again and again.

## Files
Inside each folder for a proejct there are three folders where all work should go

1. Code. For, you know, any code that you write
2. Data. 
  - This is for raw data only. Any file that goes in here should be untouched by you in any way. Your code reads or manipulates this into a form that we can use. 
  - Documentation (PDFs) for that data can also be stored here
  - A markdown file (md extension) can also go in here with description of where data was downloaded from and relevant URLs. Each raw data file should have a record in this markdown file making it clear where it was obtained.
3. Output. This is where those manipulated files get stored. 

The basic idea is that Data -> Code -> Output. 

If there are other files that you use (a research paper, etc.) those can go in the main project folder

## Excel and CSV
Excel is for raw data only. You can store an Excel file you download into the Data folder for your project. 

But all output files of data have to be in CSV format. Excel is not viable. 

If you have an Excel file as a raw input, then there must be something in Code that reads that Excel file and writes the CSV file to the Output folder. There is no cutting and pasting, or hand calculation involved or allowed here. There are routines and packages for R, Stata, and Python that read Excel. 


## Code
You can use Python, R, or Stata. I'm not conversant in other languages and I don't want to learn them. 

CoPilot, ChatGPT, and Stack Overflow are where you can find help. *I am not a help desk*

## Github
Please only post work to Github via a pull request, as opposed to using Google Docs or anything like that. That will require you to issue a "pull request" for the project. This keeps control and ensure everything is in one place. To learn how to do this you can work through Git's intro materials (which also have links to more advanced options)

[Intro to Github](https://github.com/skills/introduction-to-github)

This seems like overkill, I'm sure. From my perspective it is necessary as part of managing many projects, and is a usual feature of projects like this which operate on plain text data files. See learning Git as a feature here, as it is something you can put on a resume and use to assist in finding other RA jobs.

To assist, you can also download [Github Desktop](https://desktop.github.com/download/) which gives you a GUI interface and helps step through the process of pushing your work to the repository online.
