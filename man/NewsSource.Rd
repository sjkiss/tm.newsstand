\name{NewsSource}
\alias{NewsSource}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
NewsSource
}
\description{
This function reads in a text file of articles downloaded from the NewsStand database.
}
\usage{
NewsSource(x, encoding = "UTF-8")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{encoding}{
%%     ~~Describe \code{encoding} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, encoding = "UTF-8") 
{
    content <- readLines(x)
    content <- content[1:(length(content) - 6)]
    content <- content[grep(".", content)]
    num <- cumsum(grepl("______________", content))
    content <- split(content, num)
    s <- tm::SimpleSource(encoding, length = length(content), 
        content = content, uri = x, reader = readNews, class = "NewsSource")
    s
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
