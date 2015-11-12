\name{tm.newsstand-package}
\alias{tm.newsstand-package}
\alias{tm.newsstand}
\docType{package}
\title{
Plugin to the tm package for the Canadian Newsstand databse.
}
\description{
This package serves as a plugin for the tm package to read in news articles from the Canadian NewsStand database and extracting metadata.
}
\details{
This package was developed primarily to take advantage of useful metadata that are produced in output from ProQuest's Canadian NewsStand database.  This database contains most Canadian newspapers and television shows and is widely subscribed to by Canadian universities. As such, this package is meant to improve the ability of Canadian researchers to make use of these data.  

Please note: in its current form it \emph{requires} the output from Canadian NewsStand to be in a particular format.  Please pay attention to the following options when downloading material from the Canadian Newsstand database.
\itemize{
\item It appears that Canadian Newsstand has moderately different fields and field orders for different newspapers, article types and media types.  The function NewsSource() is currently built with an eye to extracting the most metadata possible out of newspapers (as opposed to TV transcripts or other media).  It has been tested on a number of regional and national publications and it seems to be working well, but the package author cannot guarantee that it might not falter on a particular newspaper. 
\item Articles must be exported from Canadian Newsstand as .txt files 
\ite When exporting, users are advised to select the ``Full text(citation, abstract, full text)'' option
\item Users \emph{must not} include a Table of Contents, bibliographic elements or a cover page. Otherwise NewsSource() will choke
\item Users should also include Document Numbering, although I don't believe this is strictly necessary. 
}
}
\author{
Simon J. Kiss, Wilfrid Laurier University

Maintainer: Simon Kiss <skiss at wlu dot ca>
}
\references{
Feinerer, I. “Introduction to the Tm Package Text Mining in R,” July 10, 2014.
}

\keyword{ package }
\examples{
~~ simple examples of the most important functions ~~
}
