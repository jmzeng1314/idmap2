##' get the gene symbols of probes for each GPL
##'
##' get_soft_IDs need the name of GPL, such as GPL570, and it will return a data.frame
##'
##' @param gpl the name of GPL, such as GPL570
##' @return a data.frame which contains the gene symbols of probes
##' @examples
##' get_soft_IDs('gpl570')
##' @export

get_soft_IDs <- function(gpl){
  # gpl='gpl570'
  gpl=toupper(gpl)
  if(!gpl %in% unique(gpl_list$gpl)){
    stop('your gpl is not in our annotation list.')
  }
  ids=try( get(gpl) )
  if(isTRUE(class(ids)=="try-error")) {
    stop('there is no soft annotation for this gpl')
    }

  return(ids)
}
