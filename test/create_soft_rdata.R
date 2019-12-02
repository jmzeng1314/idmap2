load('p2s_df_from_soft.Rdata')
head(p2s_df)
tmp=split(p2s_df,p2s_df$gpl)
names(tmp)
head(tmp[[1]])
ns=lapply(tmp, function(x){
  # x=tmp[[1]]
  ids=x[,1:2]
  assign(x[1,3],ids, envir = .GlobalEnv)
 return(as.name(x[1,3]))
})
ns
library(usethis)
do.call("use_data",ns )
# https://stackoverflow.com/questions/1236620/global-variables-in-r
# https://stackoverflow.com/questions/49673667/how-to-use-devtoolsuse-data-on-a-list-of-data-frames


rm(list=ls())
options(stringsAsFactors = F)
gpl_list=read.csv('gpl_list.csv')
usethis::use_data(gpl_list)

