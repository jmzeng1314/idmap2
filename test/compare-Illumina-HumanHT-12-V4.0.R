library(idmap1)
library(idmap2)
data(gpl_list)
gpl_list[,1:4]
unique(p2s_df$gpl)
ids1=idmap1::getIDs('GPL10558')
ids2=idmap2::get_soft_IDs('GPL10558')
# 首先可以看到 14109 个探针被注释
ids2_uniq=ids2[!ids2[,1] %in%  ids1[,1],]
ids2_uniq=ids2_uniq[nchar(ids2_uniq[,2])>1,]
ids2_uniq=ids2_uniq[!grepl('permuted_negative',ids2_uniq[,2]),]
# 检查可以看到，大部分基因都是很诡异的名字。
tmp=idmap1::annoGene(ids2_uniq[,2],'SYMBOL')
# 可以看到，高达80%的基因在gencode数据库的V32是无法找到的
# 说明这些基因名字大部分作废了。
table(tmp$biotypes)
