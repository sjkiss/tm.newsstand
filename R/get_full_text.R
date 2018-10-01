get_full_text <- function(x){
  start <- grep('Full [Tt]ext:', x)
  end <- grep(':', x) 
  end <- end[which(end > start)[1]] - 1
  x[start:end]
}