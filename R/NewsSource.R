NewsSource<-function(x, encoding = "UTF-8") {
  # Use filename 'x' to read the file and split it
  # into a character vector called 'content' with one item
  # per document
  content<-readLines(x, warn=FALSE)
  content<-content[1:(length(content)-6)]
  ###The following are lines of usually superfluous information that are placed between the full text and Title:.  They are annoying because they are not always attached to every article, making them useless as markers to end the full text section via grep in readNews. If we did not delete them, they would end up in the full-text section of every corpus element.  They have to be deleted with the invert argument because grepping those lines that do not match ^Subject: via the -grep argument fails when there are none of these lines in a document. This has happened.
  content<-   content[grep('^Credit:', content, invert=TRUE)]
  content<-   content[grep('^Subject:', content, invert=TRUE)]
  content<-content[grep('^Location:', content, invert=TRUE)]
  content<-content[grep('^People:', content, invert=TRUE)]
  content<-content[grep('^Company/Organization:', content, invert=TRUE)]
    content<-content[grep('^Illustration ', content, invert=TRUE)]
    content<-content[grep('^Links: ', content, invert=TRUE)]
      content<-content[grep('^Identifier / keyword', content, invert=TRUE)]
  #content<-content[-grep('Caption:?', content)]
  # content<-content[-grep('________', content)]
  content<-content[grep('.', content)]
  num <- cumsum(grepl("______________", content))
  content<-split(content, num)

  #New code with SimpleSource
  s<-tm::SimpleSource(encoding, length = length(content), content = content,
                       uri = x, reader = readNews, class = "NewsSource")

  s
}