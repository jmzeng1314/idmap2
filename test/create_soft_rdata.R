load('~/Documents/GPL/p2s_list_from_soft.Rdata')
length(p2s_list)
names(p2s_list)
head(p2s_list[[1]])
ns=lapply(p2s_list, function(x){
  # x=tmp[[1]]
  ids=x[,-3]
  y=paste0(x[1,3],'_soft')
  assign(y,ids, envir = .GlobalEnv)
  return(as.name(y))
})
ns
library(usethis)
do.call("use_data",ns)
# https://stackoverflow.com/questions/1236620/global-variables-in-r
# https://stackoverflow.com/questions/49673667/how-to-use-devtoolsuse-data-on-a-list-of-data-frames


rm(list=ls())
options(stringsAsFactors = F)
gpl_list=read.csv('gpl_list.csv')
usethis::use_data(gpl_list)

