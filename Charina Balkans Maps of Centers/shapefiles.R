library(rgdal)


serbiamap <- readOGR(dsn="Serbia_shapefile", layer="SRB_adm1")

bulgariamap <- readOGR(dsn="Serbia_shapefile", layer="BGR_adm1")

hungarymap <- readOGR(dsn="Serbia_shapefile", layer="HUN_adm1")

plot(serbiamap, 
     col = "grey", 
     border="#FDC82F",
   )

plot(bulgariamap, 
     add  = TRUE, 
     border="#FDC82F",
     col = "grey")

plot(hungarymap, 
     add  = TRUE, 
     border="#FDC82F",
     col = "grey")