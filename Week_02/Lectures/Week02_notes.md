Week 02 Notes
================
Haley Poppinga
2025-09-02

## Week 02 Lecture: Reproducible Research and Markdown Tutorial

Week 2a In-Class Lecture: Reproducible Research

What is reproducible science? - NSF Definition: reproducibility refers
to the ability of a researcher to duplicate the results of a prior study
using the same materials as were used by the original investigator.’”

- Lots of scientists said there’s a reproducibility crisis

Types of reproducibility - “Computational reproducibility:

    *   when detailed information is provided about code, software, hardware and implementation details.”

- “Empirical reproducibility:

- when detailed information is provided about non-computational
  empirical scientific experiments and observations.

- In practice this is enabled by making data freely available, as well
  as details of how the data was collected.”

- “Statistical reproducibility:

- when detailed information is provided about why you chose statistical
  tests, model parameters, threshold values, etc.

- This mostly relates to pre-registration of study design to prevent
  p-value hacking and other manipulations.”

Areas for improvement

- No clear or organized history of what’s been done to the data from raw
  data through final figures/results

- Don’t know steps that researcher took

- Lack of comments/annotation describing the steps

- Helps reader understand why you did what you did

- Tedious & time consuming for a collaborator to recreate the analyses

- Backed up w/version control? Probably not…

- How do we transfer this into a final report or presentation?

Is that reproducible?

- Why it matters

- Have information without order- bad

- Put the things in clear/logical order, with notes, why you did what
  you did

- Should look like an alibi

- Raw data

 organized/annotated wrangling—clear/open analyses (write it like you
expect the world tosee it \* create a fully reproducible graphs, tables,
reports

- Back up everything (version control)

- Make it easy to understand, update, reproduce (scripts/markdown)

Workflow

- We will do everything in well-annotated, organized scripts that
  contain streamlined and easy-to-follow records of our entire analyses
  from raw data through final reports, with unbreakable file paths and
  with a complete history of changes made.

- Thorough documentation + comments

- .R scripts/R markdown (.Rmd)

- Keep raw data RAW!

- down family (markdown, bookdown, blogdown)

- R projects, here!

- Version control w/ Git!

Open science: Should data and protocols be public?

- More data = more power but science must be reproducible

- Who paid for this data collection?

  - If on federal or state grant, then the tax payers paid for your
    dollars and it should be available to them

  - Can go online to see when and how it needs to be available

   Each institution has its own repository

- BCO-DMO (for NSF), Genbank, EDI, Pangea, publications

- Depends on where your data is funded from and where you are publishing

- Examples

- Putnam Lab

- Lab notebooks for each person in the lab with data and codes
  accessible

- Silbiger Lab

- Protocols for how everything was collected

- What if someone steals my data

- Oh they are doing something similar, lets collaborate instead of
  thinking they are stealing ideas and data

- If you take someone else’s protocol for example: “Modified from Putnam
  Protocol…”

- Having your data uploaded as soon as it is taken is like a time stamp
  for exactly when it was done

- FAIR principles

o Findable

o Accessible

o Interoperable

o Reusable

- CARE principles

o Collective benefit

o Authority to control

o Responsibility

o Ethics

- In Hawaii  CARE principles important

o Collective beneft

    *   For inclusive development and innovation
    *   For equitable outcomes
    *   For improved governance and citizen engagement

o Authority to Control

o Responsibility

    *   For expanding capability and capacity
    *   For positive relationships
    *   For Indigenous languages and worldviews

    Using Hawaiian names instead of common names

o Ethics

Tools for reproducible science:

- Rstudio (R + RStudio)

- Github (git +GitHub)

o Why use it?

o Git

       Distributed version control system
       Imagine if Dropbox and “track changes” from MS word had a baby
       Optimized for the things that data scientists spend a lot of time working on (e.g. code)
       Worth the learning code

o GitHub

       Different from git
       Online hosting platform that provides an array of services that are built on the Git system
       Like how we don’t need RStudio to run R code, we don’t need GitHub to use Git

- Git and GitHub operationalize the ideals of open science and
  reproducibility

o Journals have increasingly strict requirements regarding
reproducibility and data access

       GitHub makes this easy (DOI integration, off-the-shelf licenses, etc.)

o Host all my code, data for my research papers, and research protocols
on GH

o GH helps us to collaborate with others and your future self

- Together

o Start with Rprojects to keep organized

o Basic R project set up

       Your project name
       .Rproj (R Project File)
       Data
       Script

- Functions

- Analysis A (R)

- Analysis B (R)

 Output

- Plots

- Data

Create Repository

- Name

- Description

- Public

- Readme ON

- Your own repo or someone elses click Code then copy HTTPS

Important thing to know to version-control your repository:

- Pull

- Add

- Commit

- Push

- Remember it by Please Always Carry Pizza

o *Pull* - \[git pull\] this “downloads” any changes to your repository
on github, by your collaborators, or your past self on a different
machine. (always do this first! You may have forgotten that you made a
change.)

o *Add* - \[git add\] this stages files. It tells git, “I want to add
these to the repository”

o *Commit* - \[git commit\] this “saves” your changes with git (as
opposed to ctrl+S which saves them to your local machine – although you
should still do that too)

 git commit always requires a message so that you know what changes you
made.

• ex: git commit -a -m “I created a test repo”

 “-a” means commit all (every change) “-m” means (I am adding a
message). What you have in quotes is your message.

o *Push* - \[git push\] this “uploads” your changes to github.

Work with git in the terminal

• First, let’s create and save a simple script (save it as
“testscript.R”)

• Now, let’s save it to git

• click on the terminal tab (next to console). This allows you to
interact directly with your terminal

• type “git pull” (it should say already up to date because you have not
done anything yet)

• type git add testscript.R (this stages the new script)

• type git commit -a -m “I am adding testscript”

• type git push

• you may get prompted for your username and password

• make a new script (testscript2.R)

• Find the git tab on the right-hand site

• check the box next to testscript2.R (this adds it – once you add a
script, you never have to add it again. Only commit new changes)

• click commit and add a message

• press commit and when it is done hit close and exit out

• next hit “push”

• when it is done close it. You should no longer see “testscript2.R” in
the upper right-hand side.

• check github! (Don’t forget to refresh the webpage)

• Let’s make some changes to testscript.R

• add any code you want to it, commit it (with a message), and push it

• click history (the clock on the top) to see what changes were made and
by who

• You notice that your cat walked across the screen totally screwed up
your code. Oh no!

• It’s ok… you can revert it

• Click the blue wheel and then revert

• Note: commit often (it will only revert back to the last commit you
made. This is like pressing the save button. Do it with every major
change to your script.)

• click settings and scroll all the way to the bottom (‘Danger Zone’)
and delete repository and follow directions

\*everytime you are using Git you are in the terminal

\*everytime you are using GitHub you are in the Console

When working in git repository and want to make changes:

1)  Git pull
2)  Git add
3)  Git commit
4)  Git push

To go from lecture code to presentation: Click on .html file Copy and
paste into githack Copy URL development Paste into web browser

Week 2b Video Lecture: Git Organizations - OCN-682-UH - Everuthing in
class in here

Clone class repos - Fall-2025: where all info for class will be o Cannot
push this repo o Use git pull every class to download all class
materials - Your Last Name o Where we will turn in all our assignments o
Only we have access and can push - How to clone o Copy HTTPS from code
on GitHub o Go to R, create a new project  Version Control  Git o
Paste URL. Put directory name if not automatic o browse to put it in
Repositories folder o create project and double check - switch between
projects by clicking top right corner Projects - Git Pull o Git is not
part of R so need to go into Terminal and type git pull - View lecture
slides in class without downloading anything to computer o Copy website
URL of the html file (not the .Rmd markdown) on github into 
Raw.githack.com o Copy the “use this URL for development” link into your
browser

Proper file structure - Need to organize files in R with working
directories - Repos should be set-up to have 3 subfolders: o Data o
Scripts o Output - Think of one repo as one project or publication or
chapter - Do not put everything you do in one repo o Basic R project set
up  Your project name • .Rproj (R Project File) • Data • Script o
Functions o Analysis A (R) o Analysis B (R) • Output o Plots o Data -
File structure for class o Have one folder for every week o Within that
weekly folder have a folder named Data, Scripts, and Output  Week_03 •
Data • Scripts • Output - Adding folders to Git o Add all contents in a
folder at once by git adding the folder o git add Week_03/  will add
all the contents in the Week_03 folder so that you do not have to do it
one by one o git will not put an empty folder on GitHub (there is
nothing inside) o if you go to git add and git push scripts without
doing an output then it wont show up

Reproducible Projects require clear Readme files - file where it
explains everything going on within your project o title of her paper o
what is in here o link to publication o funding info o everything within
each folder  example: data folder has Clean, Biogeochem, Composition o
explanation of everything in the folders  info on scripts  links to
script o important because it is the interface that everyone will read

Readme Files - give an overview of what the reader will find - list the
contents of the repository - if for a publication o list authors o
journal information o funding (if relevant) o citation o content - how
to edit a readme file o Markdown—lightweight markup language with plain
text formatting syntax o Why write with Markdown when you can press
buttons in an interface to format your text?  Markdown can be used for
everything. People use it to create websites, documents, notes, books,
presentations, email messages, and technical documentation.  Markdown
is portable. Files containing Markdown-formatted text can be opened
using virtually any application. If you decide you don’t like the
Markdown application you’re currently using, you can import your
Markdown files into another Markdown application. That’s in stark
contrast to word processing applications like Microsoft Word that lock
your content into a proprietary file format.  Markdown is platform
independent. You can create Markdown-formatted text on any device
running any operating system.  Markdown is future proof. Even if the
application you’re using stops working at some point in the future,
you’ll still be able to read your Markdown-formatted text using a text
editing application.  Markdown is everywhere. Websites like Reddit and
GitHub support Markdown, and lots of desktop and web-based applications
support it. • I just copied all this text ^ from .Rmd markdown - How to
learn o Markdown guides [Markdown
Basics](https://www.markdownguide.org/basic-syntax/) o Free online
tutorials [Online tutorial](https://www.markdowntutorial.com/) o Free
online Markdown editor [dillinger](https://dillinger.io/)

Proper script structure - Creating a transparent script o Do
collaborators know what you did? o Do **you** know what you did? Can you
go back to the code in a year after a reviewer asked you to change your
analysis? - Your script should be divided into 5 (ish) subsections
(depending on what you are doing) o 1. A short **intro** to the purpose
of the code  
o 2. Loading the **libraries** that you use in the script  
 Always do it at top of script o 3. A list of important **functions**
(we won’t use these until later in the semester)  
 At beginning of script so available throughout o 4. Read in your
**data**  
o 5. Code for your **data analysis**  
 This will be divided further based on your own personal analysis  
- Creating a transparent script o ![Scripts](libs/Images/script.PNG)

Section 1: Start with a short intro of what your intend to do with your
script. Say who you are, the date you created it, and when you last
edited it.

Section 2: Load the libraries. Here, I load all the libraries that I
need for my code to run.

Section 3: Functions. If you will be creating your own functions it is
best to put them all right up front so that they are available for the
whole script. If I have lots of functions, sometimes I will put them in
their own script and then source them in so that it is not so messy.
More on that later.

Section 4: Load data. This is where you load all your data files.

Section 5 and beyond: All your analyses, which can also be subset into
different sections.

**Probably the most important advice that I can give you is to comment,
comment, comment, and comment some more on your code.**

- Create our first simple script o Navigate to the project with your
  last name o Create a folder titled “Week_02” and 3 subfolders titled
  “Scripts”, “Data”, and “Output” o You can do this directly in the
  folder on your computer, in RStudio by clicking “New folder”, or in
  the terminal by typing *mkdir foldername* o cd Week_02 creates
  cirectory

- Before we make our script we are going to install two packages. o A
  package is a library of canned functions. o You download and install
  them onto your local harddrive in order to use them. o To install a
  package you type **in the console**:  install.packages(“PackageName”)
  o You **do not** need to put this in your script because you only ever
  do it once (unless you need to update the package). Think of it as
  installing a program. You only install it once. You do not need to
  install it again everytime you open it.

- Install packages .center\[ o The {here} package helps us easily
  navigate around our projects.  
  o We will use this to make unbreakable file paths. 
  install.packages(“here”)

- What do we mean by “unbreakable file paths”? o **Consider**: an
  absolute file path o my_data \<- read_csv(“usr/nsilbiger/My
  Documents/ComputerModeling/Fall 2025/Lab 1/data/some_data.csv”) 
  Note: the code to read in data is *read_csv(“file path to data”)*. The
  file name in this example is **some_data.csv**  Create a file path
  regardless of which computer we are working on  
  • Different computer • Move file on same computer • PC vs Mac slash
  direction • Switch user accounbts • Share code wit a collaborator o In
  this example, we have named our new dataframe *my_data*.

- A better way o Work in a self-contained place  R Projects o
  Organization necessary files within it  Project organization o Point
  to relative locations  here()

- .csv files in data folder in my_projects folder

- If I am working within my project, then to read in the sb_temp.csv
  file (which is in the data folder), I can use the **here::here()**
  function: o (the left of the :: is the *package name* and to the right
  is the *function name*. In this case, they are both *here*) o
  my_data\<-read_csv(here(“data”,“sb_temp.csv”))  this code says “read
  the csv file named sb_temp.csv that is in the folder data”

- install Tidyverse o “The tidyverse is a coherent system of packages
  for data manipulation, exploration and visualization that share a
  common design philosophy.”\] Create our first simple script

- You should now have {here} and the {tidyverse} installed on your
  computer.  

- Today, we are just going to load some libraries and read in a simple
  .csv file.  
  o Copy the **“weightdata.csv”** file from the Fall-2025 repo into your
  own private repo. Put it in the **data** folder within **Week_02**.  
  o Open a new script and save it in your **scripts** folder within
  **Week_02**. You can name it whatever you want.

- # Let’s create our first simple script

  o Next, we want to load the libraries that we plan to use. o Adding
  the extra hashtags after load libraries makes a new section (notice
  the little carrot that appears) \### Load libraries \##########
  library(tidyverse) library(here)

# Let’s create our first simple script

Next, let’s read in our data using the {here} package. weightdata.csv is
in folder data, which is in folder Week_2

### Read in data

WeightData\<-read_csv(here(“Week_02”,“data”,“weightdata.csv”)) Lastly,
for today, some analysis.  
We will simply look at the data.

### Data Analysis

head(WeightData) \# Looks at the top 6 lines of the dataframe

# Let’s create our first simple script

tail(WeightData) \# Looks at the bottom 6 lines of the dataframe
View(WeightData) \# opens a new window to look at the entire dataframe

# For lab today you have three tasks

1.  Push the Week 2 folder with your first script and associated data
    onto your personal GitHub repository

2.  Complete the [Online Markdown
    tutorial](https://www.markdowntutorial.com/)

3.  Edit your readme file to say something useful about your repository.

Complete all 3 before Tuesday at 1pm. Feel free to ask your classmates
for help

Reminder on R packages

Import Data

Create file structure for class

Basic markdown for Readme files - Can type straight into README.md on R
script - And can preview - Can also edit directly on GitHub or on
markdown files

## I UNDERSTAND EVERYTHING BELOW AND AM TOO LAZY TO EDIT MY NOTES

#### I originally took these notes on a non-R document and just copy pasted here

------------------------------------------------------------------------

### Markdown Tutorial

- Italics and Bold o To make a phrase italic in Markdown, you can
  surround words with an underscore (\_ ). For example, *this* word
  would become italic.  For this next lesson, make the word “not”
  italic. • Writing in Markdown is *not* that hard! o Similarly, to make
  phrases bold in Markdown, you can surround words with two asterisks (
  \*\* ). This will **really** get your point across.  In the box
  below, make the word “will” bold. • I **will** complete these lessons!
  o In the box below, make the words “Of course” italic, and the words
  “a little moxie” bold.  *“Of course,”* she whispered. Then, she
  shouted: “All I need is **a little moxie**!” o For the final exercise
  in this lesson, we’re going to make some words bold and italic. o In
  general, it doesn’t matter which order you place the asterisks or
  underscores. In the box below, make the words “This is unbelievable”
  both bold and italic. Place the asterisks ***on the outside***, just
  to make it more legible.

- Headers o There are six types of headers, in decreasing sizes: o This
  is header one o This is header two o This is header three o This is
  header four o This is header five o This is header six o To make
  headers in Markdown, you preface the phrase with a hash mark (#). You
  place the same number of hash marks as the size of the header you
  want. For example, for a header one, you’d use one hash mark (# Header
  One), while for a header three, you’d use three (### Header Three). 
  For this next lesson, make each header the right size. • \# Header one
  • \## Header two • \### Header three • \#### Header four • \#####
  Header five • \###### Header six o It’s up to you to decide when it’s
  appropriate to use which header. In general, headers one and six
  should be used sparingly. o You can also mix and match inline styles
  within headers, such as italicizing them. In the box below, make the
  first line a heading level four, and italicize the name of the book: 
  \#### Colombian Symbolism in One Hundred Years of Solitude  Here’s
  some words about the book *One Hundred Years…*.

- Links o We’ll now learn how to make links to other web sites on the
  World Wide Web. o There are two different link types in Markdown, but
  both of them render the exact same way. The first link style is called
  an inline link. To create an inline link, you wrap the link text in
  brackets ( \[ \] ), and then you wrap the link in parentheses ( ( ) ).
  For example, to create a hyperlink to www.github.com, with a link text
  that says, Visit GitHub!, you’d write this in Markdown: [Visit
  GitHub!](www.github.com).  In the box below, make a link to
  www.google.com, with link text that says “Search for it.” • [Search
  for it.](www.google.com) o You can add emphasis to link texts, if you
  like. In the box below, make the phrase “really, really” bold, and
  have the entire sentence link to www.dailykitten.com. You’ll want to
  make sure that the bold phrasing occurs within the link text brackets.
   [You’re **really, really** going to want to see
  this.](www.dailykitten.com.) o Although it might make for an awkward
  experience, you can make links within headings, too.  For this next
  tutorial, make the text a heading four, and turn the phrase “the BBC”
  into a link to www.bbc.com/news: • \#### The Latest News from [the
  BBC](www.bbc.com/news) o The other link type is called a reference
  link. As the name implies, the link is actually a reference to another
  place in the document. Here’s an example of what we mean:

- Here's [a link to something else][another place].

-    Here's [yet another link][another-link].

-    And now back to [the first link][another place].

- 

-    [another place]: www.github.com

-    [another-link]: www.google.com 

  o The “references” above are the second set of brackets: \[another
  place\] and \[another-link\]. At the bottom of a Markdown document,
  these brackets are defined as proper links to outside websites. An
  advantage of the reference link style is that multiple links to the
  same place only need to be updated once. For example, if we decide to
  make all of the \[another place\] links go somewhere else, we only
  have to change the single reference link. o Reference links don’t
  appear in the rendered Markdown. You define them by providing the same
  tag name wrapped in brackets, followed by a colon, followed by the
  link.  In the box below, we’ve started writing out some reference
  links. You’ll need to finish them up! Call the first reference tag “a
  fun place”, and make it link to www.zombo.com; make the second link
  out to www.stumbleupon.com. • Do you want to \[see something fun\]\[a
  fun place\](www.zombo.com)? • IDKKKKK????/ • Well, do I have \[the
  website for you\]\[another fun place\](www.stumbleupon.com)!

- Images o If you know how to create links in Markdown, you can create
  images, too. The syntax is nearly the same. o Images also have two
  styles, just like links, and both of them render the exact same way.
  The difference between links and images is that images are prefaced
  with an exclamation point ( ! ). o The first image style is called an
  inline image link. To create an inline image link, enter an
  exclamation point ( ! ), wrap the alt text in brackets ( \[ \] ), and
  then wrap the link in parentheses ( ( ) ). (Alt text is a phrase or
  sentence that describes the image for the visually impaired.) o For
  example, to create an inline image link to
  <https://octodex.github.com/images/bannekat.png>, with an alt text
  that says, Benjamin Bannekat, you’d write this in Markdown: ![Benjamin
  Bannekat](https://octodex.github.com/images/bannekat.png).  In the
  box below, turn the link to an image, and fill out the alt text
  brackets to say “A pretty tiger”: • ![A pretty
  tiger](https://upload.wikimedia.org/wikipedia/commons/5/56/Tiger.50.jpg)
  o Although you don’t need to add alt text, it will make your content
  accessible to your audience, including people who are visually
  impaired, use screen readers, or do not have high speed internet
  connections. o For a reference image, you’ll follow the same pattern
  as a reference link. You’ll precede the Markdown with an exclamation
  point, then provide two brackets for the alt text, and then two more
  for the image tag, like this: \![The founding father\]\[Father\] At
  the bottom of your Markdown page, you’ll define an image for the tag,
  like this: \[Father\]:
  <http://octodex.github.com/images/founding-father.jpg>. o In the box
  below, we’ve started placing some reference images; you’ll need to
  complete them, just like the last lesson. Call the first reference tag
  “Black”, and make it link to
  <https://upload.wikimedia.org/wikipedia/commons/a/a3/81_INF_DIV_SSI.jpg>;
  make the second image link out to
  <http://icons.iconarchive.com/icons/google/noto-emoji-animals-nature/256/22221-cat-icon.png>.
   \![Black cat\]\[Black\]  \![Orange cat\]\[Orange\]  \[Black\]:
  <https://upload.wikimedia.org/wikipedia/commons/a/a3/81_INF_DIV_SSI.jpg>
   \[Orange\]:
  <http://icons.iconarchive.com/icons/google/noto-emoji-animals-nature/256/22221-cat-icon.png>

- Block Quotes o If you need to call special attention to a quote from
  another source, or design a pull quote for a magazine article, then
  Markdown’s blockquote syntax will be useful. A blockquote is a
  sentence or paragraph that’s been specially formatted to draw
  attention to the reader. For example:  “The sin of doing nothing is
  the deadliest of all the seven sins. It has been said that for evil
  men to accomplish their purpose it is only necessary that good men
  should do nothing.” o To create a block quote, all you have to do is
  preface a line with the “greater than” caret (\>). For example:

- > “In a few moments he was barefoot, his stockings folded in his
  > pockets and his

- canvas shoes dangling by their knotted laces over his shoulders and, picking a

- pointed salt-eaten stick out of the jetsam among the rocks, he clambered down

- the slope of the breakwater."

   In the box below, turn the book quotation into a blockquote: • I
  read this interesting quote the other day: • \> “Her eyes had called
  him and his soul had leaped at the call. To live, to err, to fall, to
  triumph, to recreate life out of life!” o You can also place a caret
  character on each line of the quote. This is particularly useful if
  your quote spans multiple paragraphs. For example:

- > His words seemed to have struck some deep chord in his own nature.
  > Had he spoken

- of himself, of himself as he was or wished to be? Stephen watched his
  face for some

- moments in silence. A cold sadness was there. He had spoken of
  himself, of his own

- loneliness which he feared.

- > 

- > —Of whom are you speaking? Stephen asked at length.

- > 

- > Cranly did not answer. o Notice that even blank lines must contain
  > the caret character. This ensures that the entire blockquote is
  > grouped together.  In the box below, Make the entire quotation a
  > block quote by inserting a caret on each line. • \> Once upon a time
  > and a very good time it was there was a moocow coming down along the
  > road and this moocow that was coming down along the road met a
  > nicens little boy named baby tuckoo… • \> • \> His father told him
  > that story: his father looked at him through a glass: he had a hairy
  > face. • \> • \> He was baby tuckoo. The moocow came down the road
  > where Betty Byrne lived: she sold lemon platt. o Block quotes can
  > contain other Markdown elements, such as italics, images, or links.
  >  In the box below, make the French text italic (not including the
  > exclamation point). Also, turn the entire quote into a blockquote. •
  > \> He left her quickly, fearing that her intimacy might turn to
  > jibing and wishing to be out of the way before she offered her ware
  > to another, a tourist from England or a student of Trinity. Grafton
  > Street, along which he walked, prolonged that moment of discouraged
  > poverty. In the roadway at the head of the street a slab was set to
  > the memory of Wolfe Tone and he remembered having been present with
  > his father at its laying. He remembered with bitterness that scene
  > of tawdry tribute. There were four French delegates in a brake and
  > one, a plump smiling young man, held, wedged on a stick, a card on
  > which were printed the words: *VIVE L’IRLANDE*!

- Lists o There are two types of lists in the known universe: unordered
  and ordered. That’s a fancy way of saying that there are lists with
  bullet points, and lists with numbers o To create an unordered list,
  you’ll want to preface each item in the list with an asterisk ( \* ),
  then follow it with a space. Each list item also gets its own line.
  For example, a grocery list in Markdown might look like this:

- Milk

- Eggs

- Salmon

- Butter o This Markdown list would render into the following bullet
  points  Milk  Eggs  Salmon  Butter o In the box below, turn the
  Flour, Cheese, Tomatoes words separated by a comma into a list.  \*
  Flour  \* Cheese  \* Tomatoes o An ordered list is prefaced with
  numbers, instead of asterisks. Take a look at this recipe:

1.  Crack three eggs over a bowl
2.  Pour a gallon of milk into the bowl
3.  Rub the salmon vigorously with butter
4.  Drop the salmon into the egg-milk bowl o To write that in Markdown,
    you’d do this:
5.  Crack three eggs over a bowl
6.  Pour a gallon of milk into the bowl
7.  Rub the salmon vigorously with butter
8.  Drop the salmon into the egg-milk bowl o Easy, right? It’s just like
    you’d expect a list to look.  In the box below, turn the rest of
    the recipe into an ordered list.  You can choose to add italics,
    bold, or links within lists, as you might expect. In the box below,
    turn the Latin names for the plants into italics. o Occasionally,
    you might find the need to make a list with more depth, or, to nest
    one list within another. Have no fear, because the Markdown syntax
    is exactly the same. All you have to do is to remember to indent
    each asterisk one space more than the preceding item.  For example,
    in the following list, we’re going to add some sub-lists to each
    “main” list item, describing the people in detail: o When rendered,
    this list turns into the following grouping:  Tintin  A reporter 
    Has poofy orange hair  Friends with the world’s most awesome dog 
    Haddock  A sea captain  Has a fantastic beard  Loves whiskey 
    Possibly also scotch? o In the box below, turn the character’s
    characteristics into sub-bullets.  \* Calculus  \* A professor 
    \* Has no hair  \* Often wears green  \* Castafiore  \* An opera
    singer  \* Has white hair  \* Is very famous o Stupendous! While
    you could continue to indent and add sub-lists indefinitely, it’s
    usually a good idea to stop after three levels; otherwise, your text
    becomes a mess. o There’s one more trick to lists and indentation
    that we’ll explore, and that deals with the case of paragraphs.
    Suppose you want to create a bullet list that requires some
    additional context (but not another list). For example, it might
    look like this:
9.  Crack three eggs over a bowl. Now, you’re going to want to crack the
    eggs in such a way that you don’t make a mess. If you do make a
    mess, use a towel to clean it up!
10. Pour a gallon of milk into the bowl. Basically, take the same
    guidance as above: don’t be messy, but if you are, clean it up!
11. Rub the salmon vigorously with butter. By “vigorous,” we mean a
    strictly vertical motion. Julia Child once quipped: Up and down and
    all around, that’s how butter on salmon goes.
12. Drop the salmon into the egg-milk bowl. Here are some techniques on
    salmon-dropping: o Make sure no trout or children are present o Use
    both hands o Always have a towel nearby in case of messes o To
    create this sort of text, your paragraph must start on a line all by
    itself underneath the bullet point, and it must be indented by at
    least one space. For example, the list above looks like this in
    Markdown: o Notice that the first two items have a single space.
    This looks a bit odd, so you might want to indent properly to match
    the characters up (like items three and four). In these paragraphs,
    you can include all sorts of other Markdown elements, like
    blockquotes, or even other lists! o In the box below, convert the
    bullet points into their own paragraphs.
13. Cut the cheese Make sure that the cheese is cut into little
    triangles.
14. Slice the tomatoes Be careful when holding the knife. For more help
    on tomato slicing, see Thomas Jefferson’s seminal essay *Tom Ate
    Those*.

- Paragraphs o Markdown has several ways of formatting paragraphs. o
  Let’s take a few lines of poetry as an example. Suppose you want to
  write text that looks like this:  Do I contradict myself? Very well
  then I contradict myself, (I am large, I contain multitudes.) o Now,
  you might think that simply typing each verse onto its own line would
  be enough to solve the problem: o Unfortunately, you’d be wrong! This
  Markdown would render simply as a single straight line: Do I
  contradict myself? Very well then I contradict myself, (I am large, I
  contain multitudes.). o If you forcefully insert a new line, you end
  up breaking the togetherness: o This is what’s known as a hard break;
  what our poetry asks for is a soft break. You can accomplish this by
  inserting two spaces after each new line. This is not possible to see,
  since spaces are invisible, but it’d look something like this: o Each
  dot ( · ) represents a space on the keyboard. o Let’s try this
  technique out. In the box below, insert the necessary number of spaces
  to make the poem render correctly:  add two spaces after each line
  where you want it to break o Aside from formatting poetry, one of the
  common uses for these soft breaks is in formatting paragraphs in
  lists. Recall in the previous lesson that we inserted a new line for
  multiple paragraphs within a list.  In the box below, instead of
  using hard breaks, tighten the sub-paragraphs with soft breaks:
