MTRedges <- read.csv("MTRnetwork.csv", stringsAsFactors=FALSE)
require(igraph)
MTRgraph <- graph.data.frame(MTRedges, directed=FALSE)
#centrality <- page.rank(MTRgraph, directed=FALSE)$vector * 500
centrality <- betweenness(MTRgraph, directed=FALSE) / 200
#V(MTRgraph)$label.cex <- 0.6
#plot(MTRgraph,layout=layout.fruchterman.reingold, vertex.size=centrality)

pos <- layout.fruchterman.reingold(MTRgraph)
### add the z position
pos <- cbind(pos, rep(0.0, nrow(pos)))

require("rgexf")

#plot(MTRgraph, layout=pos[,1:2]) ### to make sure the pos is reproducible


### Ranking Stations
StationCentrality <- data.frame(name = V(MTRgraph)$name, betweenness = centrality)
StationCentrality[order(StationCentrality$betweenness), ]
