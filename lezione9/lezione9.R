#Studiamo la funzione di Gauss 

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

#fenomeno a "Quasi Soglia"
Admission_Predict <- read.csv("~/Desktop/Esercitazioni/R/lezione9/Admission_Predict.csv")

#esploriamo il dataset
summary(Admission_Predict)
plot(Admission_Predict$GRE.Score)
plot(Admission_Predict$Chance.of.Admit)

#costruiamo un data frme + piccolo

d <- data.frame(voto=Admission_Predict$GRE.Score, ammesso=as.numeric(Admission_Predict$Chance.of.Admit>=0.75))
plot(d) #il plot mostra il tipoco andamento di un fenomeno di quasi soglia

#esploriamo la curva logistica che è la funzione matematica da usare in questo caso
cor(d$voto, d$ammesso)

modello <- lm(d$ammesso~d$voto)
abline(modello$coefficients) #il modello lineare non è un buon modello in questo caso...

#formula della funzione logistica
#f(x) = 1 / (1+ exp(-(A*x+B)))

x <- seq(-5, 5, 0.01)
A <- 1
B <- 2

f <- 1 / (1+ exp(-(A*x+B)))

plot(x,f)
abline(v=-B/A, col="blue")
#quando x vale = -B/A f = 0.5

f1 <- 1 / (1+ exp(-(A*x+B)))
f2 <- 1 / (1+ exp(-(2*A*x+B)))

plot(x, f1)
points(x, f2, col="red")

f3 <- 1 / (1+ exp(-(A*x/2+B)))
points(x, f3, col="blue")
#al variare di A, le curve diventano più rette...
#B indica dove sta la soglia, e A indica la pendenza della curva che sale (curva logistica)

#conti sulle probabilità
p290 <- (sum(as.numeric(d$voto<=300)))

H <- hist(d$voto, bin=c(280,340,10))
A <- hist(d$voto[d$ammesso==1], bin=c(280,340,10))
P <- A$counts/H$counts[3:10] #proporzioni che hanno preso un dato punteggio e gli studenti ammessi
P <- c(0,0,P)
plot(P)

Odds <- P/(1-P)
plot(Odds)
Logit <- log(Odds)
plot(seq(290,340,10), Logit[3:8])
modelloLogit <- lm(Logit[3:8] ~ seq(290,340,10))
abline(modelloLogit$coefficients)

fp <- 1 / (1+ exp(-(modelloLogit$coefficients[2]*d$voto+modelloLogit$coefficients[1])))
plot(d$voto, fp, ylim=c(-0.1,1))
points(d$voto, d$ammesso)

#tutto ciò si fas con una semplice formula
modelloL <- glm(d$ammesso ~ d$voto, family = "binomial")
plot(d$voto, modelloL$fitted.values)

summary(modelloL)






