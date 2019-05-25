
auto <- read.csv("https://raw.githubusercontent.com/unalyticsteam/bases-de-datos/master/auto-mpg.csv", stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders)
str(auto)
attach(auto)


#### Sistema base de R para Gráficación -----------------

## boxplot 
library(dplyr)

mu <- auto %>% group_by(cylinders) %>% summarise(medias = mean(mpg))
boxplot(mpg ~ cylinders, notch = T)
points(mu$medias, col="red", pch=19)

# histogramas 

hist(mpg, probability = T, breaks = 16,
     col = "red", main="Histograma",
     xlab = "millas por galón",
     ylab = "densidad") 
lines(density(mpg), lwd = 2, col="blue")

# bar plot
tabla <- table(cylinders)
barplot(tabla, horiz = T)

# dispersión ( Scatterplot) - puntos

plot(mpg ~ weight,
     col = c("red", "blue", "yellow", "black", "green")[cylinders],
     main = expression(alpha^{2}))
legend("topright", legend = levels(cylinders),
       col =  c("red", "blue", "yellow", "black", "green"),
       pch=19, title = "Clindros")
modelo <- lm(mpg ~ weight)
abline(modelo)


plot(mpg ~ weight, type ="n")
with(subset(auto, cylinders == 5 ), points(mpg~weight, col="red"))
with(subset(auto, cylinders == 6 ), points(mpg~weight, col="blue"))
with(subset(auto, cylinders == 8 ), points(mpg~weight))

# qq - plor
qqnorm(mpg)

# trellis
coplot(mpg ~ weight | cylinders)


# matriz de dispersión 
plot()
pairs(auto[, c("mpg", "horsepower","displacement")],
      col= c("red", "blue", "yellow", "black", "green")[cylinders])


####  laticce -------------------------------
library(lattice)

# scatterplot
xyplot(mpg ~ weight | cylinders)

# boxplot
bwplot(~ weight | cylinders)


# density plot
densityplot(~mpg | cylinders)

# 3d
cloud(mpg ~ weight + horsepower | cylinders)


## rgl
#install.packages("rgl", dependencies = T)
library(rgl)

mfrow3d(2,2)
plot3d(mpg, weight, horsepower, data = auto,
       size = 12, col = cylinders, xlab = "hola")
 

# funcion par()

par(mfrow = c(2,2))
hist(mpg, col = "red")
hist(mpg, col = "blue")
hist(mpg)
hist(mpg)


####  ggplot2 -------------------------------
# hadley wickham
# gg
# gráfico = datos + estética + geometría
# qplot()  # trazado rápido 
# ggplot() # construcción por capas

library(ggplot2)


#### qplot ***************************************

# scatter plot
qplot(x = mpg ,y = weight ,data = auto, 
      geom = c("point", "smooth"), #method = "lm", se=F,
      xlab = "millas por galón",
      ylab = "peso",
      main = "peso vs mpg",
      color = horsepower)


qplot(x=mpg, geom = "histogram")

qplot(x=mpg, geom = "density")

qplot(y=mpg,x=  cylinders, geom = "boxplot")

qplot(y=mpg,x=  cylinders, geom = "violin")


## ggplot() ********************************



ggplot(data = auto, aes(x=mpg, y = horsepower)) + geom_point() +
  geom_line(data = auto[1:10,], color="red")

####
ggplot(data = auto, aes(x=cylinders, y = horsepower)) +
  geom_boxplot() + geom_dotplot(binaxis = "y", stackdir = "center", binwidth = 2) + 
  stat_summary(fun.y = mean, geom = "point", color="red") 




auto <- read.csv("https://raw.githubusercontent.com/unalyticsteam/bases-de-datos/master/auto-mpg.csv", stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders)
str(auto)
attach(auto)


# boxplot

ggplot(data = auto, aes(x=cylinders, y = horsepower)) +
  geom_violin() + labs(x="cilin", y="poder") # xlab("Cilindros") + ylab("poder")
# 

subset(auto)

ggplot(data =auto, aes(x=horsepower, color = cylinders)) + geom_density()


ggplot(data = auto, aes(x=mpg, y = horsepower, color=cylinders)) +
  geom_point() + facet_grid(cylinders~.) +
  scale_color_manual(values = c("#8CFFF1", "red", "blue", "#8CFFF1", "green" ))



# 
ggplot(data = diamonds, aes(x=carat, y = price)) + geom_hex()





ggplot(data= auto, aes(x=acceleration)) + geom_histogram(aes(y=..density..)) +
  geom_density(color = "red")


# barras 

ggplot(data=auto, aes(x=cylinders)) + geom_bar()


##

gapminder <- read.csv("https://raw.githubusercontent.com/unalyticsteam/bases-de-datos/master/gapminder.csv")

a <- ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, ids=country,
                             colour = continent,
                             size=pop,
                             frame=year)) +
  geom_point() + scale_x_log10() + facet_grid(continent~.)
  labs(title=("Expectativa de vida vs Ingreso Percapita"))
print(a)
  
library(plotly)
ggplotly(a)

