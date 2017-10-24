library(ggplot2)
library(ggmap)
library(rgdal)


area.points <- fortify(serbiamap)
area.points2 <- fortify(bulgariamap)
area.points3 <- fortify(hungarymap)

lat <- c(43.155701,43.215864,42.508519,43.020812,41.930412,42.727493,42.71246,42.683056,47.61725,44.81090)
lon <- c(22.585681, 22.316903,22.464908,22.782693,25.902586,23.323612,23.408182,23.243056, 19.18917, 20.45703)
pop <- c(251,	188,	57,	91,	2055,	714,	300,	750, 50,500)
pointnames<- c("Pirot",	"Divljana",	"Bosilegrad",	"Dimitrovgrad",	"Harmanli",	"Voenna Rampa",	"Vrazhdebna",	"Ovcha kupel","Fot","Info Park")
df <- as.data.frame(cbind(lon,lat,pop,pointnames))


ircmap <- get_map(location = c(lon = mean(df$lon), lat = mean(df$lat)), zoom = 6,
                      source = "google" , scale = 1)




ircmap <- ggmap(ircmap) +
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group),
               data = area.points,
               alpha = 0.5,size = .2)+
  
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group),
               data = area.points2,
               alpha = 0.5,size = .2)+
  
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group),
               data = area.points3,
               alpha = 0.5,size = .2)+
  
  geom_point(data = df, aes(x = lon, y = lat, size= pop), stroke = 2, colour = "#CC6600",fill="#FDC82F",shape = 23, alpha=0.7)+
  
  ggtitle('Camps Supported Through Charina Donation') +
  theme(axis.title = element_text(family = "Arial", color="#666666", face="bold", size=2)) +
  
  annotate('text', x=df$lon, y=df$lat+1, label = df$pointnames, colour = I('red'), size = 4)



plot(ircmap)
