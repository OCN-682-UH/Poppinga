Week 06
================
Haley Poppinga
2025-09-30

### Week 6 Lecture

#### Quarto

##### 2025-09-30

#### Outline

Quiz 5 What is Quarto? Metadata and outputs Basic Markdown Text Using
code chunks Next Time - Working with figures and tables - Themes -
Advanced Outputs

###### Review

If I want to convert Feb 28 2021 10:05:50 to a date, what function do I
use?  
mdy_hms(dates)

#### What is Quarto?

Analyze. Share. Reproduce. You have a story to tell with data—tell it
with Quarto.  
\* can use multiple languages in the exact same script \* feed in code
to Quarto document and it will convert to HTML, etc.

**Quarto provides a unified authoring framework for data science,
combining your code, its results, and your prose. Quarto documents are
fully reproducible and support dozens of output formats, like PDFs, Word
files, presentations, and more.**

1)  For communicating to decision-makers, who want to focus on the
    conclusions, not the code behind the analysis.  

- make a document with all the code, and then hide the code

2)  For collaborating with other data scientists (including future
    you!), who are interested in both your conclusions, and how you
    reached them (i.e. the code).

- all code and output in the same place

3)  As an environment in which to do data science, as a modern-day lab
    notebook where you can capture not only what you did, but also what
    you were thinking.  

- Jupiter notebook

##### Change your mental mode

Source to Output –\> Take notes in same place as your code. \*
everything goes into Quarto: hypotheses, figures, plots, etc.

#### Quarto is broken into 4 major parts:

- Metadata (top)
- Text (what we want to write about our code)
- Code
- Output

#### Metadata: YAML

**YAML - yet another markup language**

3x of these “-”  
key: value  
3x “-”  
\* see the top of this document \* This goes at the top of your
RMarkdown document, includes the metadata, style, and type of output for
your document.

You only need two pieces for it to work, but there is lots more to add
to make it beautiful. \* title is the title of your markdown document \*
format is the format that it will be saved as \* HTML or github document

## Example YAML

title: “Penguins Distilled” description: \| A great new article on
Penguins author: Tom Mock affiliation: RStudio date: “‘r Sys.Date()’”
format: html: toc: true toc-depth: 4 – \* toc = table of contents

You create an html document by hitting render.

#### Text

The text is written in the markdown language. You have already done a
lab on markdown and this is the exact language that you use for your
readme files. This is a short review.

**Bold**  
I **love** markdown

*Italics*  
I *love* markdown

Lists - item 1 - item 2 - item 3

Images ![](image%20link)

Links \[Silbiger Lab\] (link) no space in between tho

#### Code Chunks

You can add a code chunk by pressing - the keyboard shortcut Ctrl +
Alt + I (OS X: Cmd + Option + I) - Click Code at the top of RStudio then
+C in green.

You can control what you want printed in the html within the code chunks
by giving a key and a value within the chunks after a \#\|

[code chunk
options](https://quarto.org/docs/reference/cells/cells-knitr.html)

Global code chunk options in the YAML This will suppress warnings in
every single code chunk as a default

Totally awesome R package of the day install.packages(“beepr”)

library(beepr) beep(5) beep(9)

Let’s Quarto together!

``` r
### Quarto ###
### Created by: Haley Poppinga
### Created on: 2025_09_30
###########################################

### Week 6 Lecture ###
### We will be learning Quarto ####
### Created by: Haley Poppinga #############
### Created on: 2025_09_30 ####################


### Load libraries ###
# library(tidyverse)
# library(here)
# library(ggplot2)
# library(ghibli) 

### Read in data ###
### Load data ######
```
