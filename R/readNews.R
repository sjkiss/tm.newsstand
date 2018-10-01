readNews<-tm::FunctionGenerator(
  function(elem, language, id) {
  function(elem, language, id) {
    
    # Use elem$content, which contains one item of the 'contents'
    # vector you passed above, to create a document
    
    # In particular, you can provide the following information.
    # This code assumes that 'content' contains the plain text of
    # the article body, and that you have filled the other variables
    # with information you extracted from elem$conten
    
    author<-gsub('Author:', '', grep('^Author:', elem$content, value=TRUE))
    title<-gsub('Title:', '', grep('^Title:', elem$content, value=TRUE))
    section<-gsub('Section: ', '', grep('^Section: ', elem$content, value=TRUE))
    datetimestamp<-as.Date(
      gsub('Publication date: ', '', grep('^Publication date:', elem$content, value=TRUE)), format="%b %d, %Y")
    origin<-gsub('Publication title:', '', grep('^Publication title:', elem$content, value=TRUE))
    id<-as.numeric(gsub('ProQuest document ID: ', '', grep('^^ProQuest document ID:', elem$content, value=TRUE)))
    ####Note: Just because ProQuest decides to be a little tricky with their encoding of "Full Text", you have to account for both capital T and small t. Thanks ProQuest!
    #Note the following line is deprecated
    #It is stored here for legacy sakes
  #  content<- elem$content[grep('^Full [Tt]ext:', elem$content):grep('^Title:', elem$content)-1]
    #This draws on the function get_full_text() defined in the package
 content<- get_full_text(elem$content)
    doc <- PlainTextDocument(x = gsub('Full Text: |Full text: ', '', content),
                             author = author,                            
                             heading = title,
                             id = id,
                             datetimestamp =datetimestamp,
                             origin = origin
    )
    
    # To set additional information about the article, use
    meta(doc, "Length") <- sum(sapply(gregexpr("\\W+", doc), length) + 1)
    meta(doc, "Section")<-section
    doc
  }
}
)