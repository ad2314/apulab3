normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x))) }
sm <- read.csv("C:/Users/adix1/Documents/GitHub/apulab1/aparaty_dane.csv")
price <- normalize(sm$cena)
sensitivity <- normalize(sm$zakres_czulosci)
resolution <- normalize(sm$rozdzielczosc)
sm <- sm[,-1]
sm <- sm[,-4]
sm <- sm[,-4]
sm <- sm[,-4]
sm
sm <-cbind(sm, price, sensitivity, resolution)
net.price <-neuralnet(price~sensitivity+resolution, sm, hidden=c(8,7,6,7), threshold = 0.01)
plot(net.price)
