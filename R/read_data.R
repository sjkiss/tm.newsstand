#Load devtools
library(devtools)
#Installpackage
install_github("sjkiss/tm.newsstand")
#Attach libraries
library(tm.newsstand)
library(tm)
#Set your working directory
setwd('~/Your/directory')
#setwd('/Users/Simon/Downloads')
#Readin Globe articles
globe<-NewsSource('globe.txt')
#Make Globe corpus
globe.corp<-Corpus(globe)
#Read in Whig-Standard
whig<-NewsSource('kingston_whig_standard.txt')
#Make Whig Corpus
whig.corp<-Corpus(whig)
#Read in Caglary articles
calgary<-NewsSource('calgary_herald.txt')
#Make Calgary Corpus
calgary<-Corpus(calgary)
#Read in Victoria articles
victoria<-NewsSource('victoria_times_colonist.txt')
#Make Victoria corpus
victoria.corp<-Corpus(victoria)
#read in Winnipeg articles
winnipeg<-NewsSource('winnipeg_free_press.txt')
#Make Winnipeg Corpus
winnipeg.corp<-Corpus(winnipeg)
#read in Ottawa articles
ottawa<-NewsSource('ottawa_citizen.txt')
#Make ottawa corpus
ottawa.corp<-Corpus(ottawa)
#read in cbc articles
cbc<-NewsSource('cbc_the_national.txt')
#Make CBC Corpus
cbc.corp<-Corpus(cbc)
#Check meta data
lapply(cbc.corp, meta)
#Read in articles from multiple newspapers articles
multi<-NewsSource('multiple_papers.txt')
#Make multi-corpus
multi.corp<-Corpus(multi)
#Get meta data
meta.multi<-lapply(multi.corp,meta)
meta.multi
#Get Sections
sections<-unlist( #unlist what follows
    lapply(meta.multi, function(x) x$Section #on each element, get the section
           )#close lapply loop
         )#close unlist loop
#Check Sections
sections
#get dates
story.dates <-lapply(meta.multi, function(x) as.Date(x$datetimestamp))
#Unlist() kills the date format so use do.call() instead. Frustrating.
story.dates<-do.call('c', story.dates)
#Cut 
barplot(#begin barplot
  table(#begin table
    cut(story.dates, 'years')#break the story.dates vector into years
    )#Close table
  )#close barplot

#check length of sections, dates and multi.corp for validation purposes
length(sections)
length(multi.corp)
length(story.dates)

