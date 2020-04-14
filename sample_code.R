#code to do quick visualization of data
library(igraph)
oddsmat <- as.matrix(read.csv('comorbidity_odds_matrix.csv', row.names=1))
shortnamevec <- c("Her","Def","Adj","Ane","Ast","ADHD","Bac","Bil","Bur",
                  "NIn","CVD","COPD","Ulc","Coag","Coma","CIj",
                  "Dem","Dev","Art","Mou","Hea","Uri","Vei","WBC",
                  "Lip","Jaw","Ch","Ear","Ep","Eye","Ele",
                  "Fr","GIH","Gou","HA","NSC","HTN","Imm","Imp",
                  "ArI","IIn","BIj","TJ","Liv","LGI","Myc",
                  "NTJ","Gas","Nut","Wou","Ost","Bone","Con","End",
                  "GIO","HeO","InO","SInf","IjO","LRO","NSO",
                  "NuO","SkO","URO","Pan","Par","PFr","Per","Ple",
                  "Poi","RF","RIn","SIn","Spi","Bac","Spr","Sui",
                  "SuIj","Lup","Thy","UGI","Vir","Alc","Drg","Sch","MDD",
                  "BPD","PTSD","DepO","AnxO","GAD","DM","Neo","Con","Gen")
whichpsych <- c(3,6,17, 18, 27, 39, 68 ,77 ,83 ,84 ,85, 86, 87, 88, 89, 90, 91)
row.names(oddsmat) <- colnames(oddsmat) <- shortnamevec
G.oddsmat <- graph_from_adjacency_matrix(t(oddsmat), mode = 'directed', diag = F, weighted = T)
namevec <- row.names(oddsmat)
V(G.oddsmat)$color <- 'DodgerBlue'
V(G.oddsmat)$color[V(G.oddsmat)$name %in% namevec[whichpsych]] <- 'tomato'
G.oddsmat.2 <- delete_edges(G.oddsmat, E(G.oddsmat)[weight<1])
G.oddsmat.3 <- decompose(G.oddsmat.2, min.vertices=3)[[1]]
plot(G.oddsmat.3, vertex.size=3, edge.arrow.size = 0.1, vertex.label.cex=0.5, 
vertex.frame.color = 0/0, edge.width = E(G.oddsmat.3)$weight/10,vertex.label.color='black')