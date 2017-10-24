library(ggplot2)
library(ggmap)
library(rgdal)


area.points <- fortify(serbiamap)
area.points2 <- fortify(bulgariamap)

lat <- c(43.155701,43.215864,43.020812,41.930412,42.727493,42.71246,42.683056,42.55346)
lon <- c(22.585681, 22.316903,22.782693,25.902586,23.323612,23.408182,23.243056,24.83185)
pop <- c(251,	188,	91,	2055,	714,	300,	750,105)
pointnames<- c("Pirot",	"Bela Palanka",		"Dimitrovgrad",	"Harmanli",	"Voenna Rampa",	"Vrazhdebna",	"Ovcha kupel","Banya")
df <- as.data.frame(cbind(lon,lat,pop))


ircmap <- get_map(location = c(lon = mean(df$lon), lat = mean(df$lat)), zoom = 6,
                      source = "google" , color = "bw", scale = 1)




ircmap <- ggmap(ircmap, darken = c(0.12, "#FDC82F")) +
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group),
               data = area.points,
               alpha = 0.7,size = .2)+
  
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group),
               data = area.points2,
               alpha = 0.7,size = .2)+
  
  geom_point(data = df, aes(x = lon, y = lat, size= pop), stroke = 2, colour = "#CC6600",fill="#FDC82F",shape = 21, alpha=0.7)+
  
  ggtitle('Camps Supported Through Charina Donation') +
  theme(axis.title = element_text(family = "Arial", color="#666666", face="bold", size=2)) 



plot(ircmap)
