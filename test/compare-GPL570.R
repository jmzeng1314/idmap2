library(idmap1)
library(idmap2)
unique(p2s_df$gpl)
ids1=getIDs('gpl570')
ids2=get_soft_IDs('gpl570')
# 首先可以看到 12738个探针被注释
ids2_uniq=ids2[!ids2[,1] %in%  ids1[,1],]
# 但是只有4333个是有基因信息的
ids2_uniq=ids2_uniq[nchar(ids2_uniq[,2])>1,]
## 去除掉比对到多个基因的那些探针,还有2004个
ids2_uniq=ids2_uniq[!grepl('///',ids2_uniq[,2]),]
# 检查可以看到，大部分基因都是很诡异的名字。
tmp=annoGene(ids2_uniq[,2],'SYMBOL')
# 可以看到，高达80%的基因在gencode数据库的V32是无法找到的
# 说明这些基因名字大部分作废了。
table(tmp$biotypes)
