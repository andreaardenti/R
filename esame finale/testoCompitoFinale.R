# prova finale Catania 25 marzo 2019

# studente
# COGNOME <- ARDENTI
# NOME <- ANDREA

# 0
# ottieni il file dati "datam.csv"
datam <- read.csv("~/Desktop/Esercitazioni/R/esame finale/datam.csv")

# 1
# importa i dati "datam.csv" in un data frame 
df <- data.frame(datam)

# 2
# I dati rappresentano statistiche relative alla qualit? di varie universit? della Turchia
# Ci sono 15 variabili, ma tu utilizzerai solo:
#   impact_rank   : posto in graduatoria mondiale circa la quantit? di ricerca svolta
#   excellence_rank : posto in graduatoria modniale circa la qualit? di ricerca svolta
#   facebook : post su FB in un anno relativi a persone/studenti dell'Ateneo

# crea quindi un nuovo data frame D che contenga solo le 3 colonne appena elencate, e chiamale
# imp, exc, fbk
D <- data.frame(imp=df$impact_rank, exc=df$excellence_rank, fbk=df$facebook)

# 3
# elimina gli eventuali NA, quanti ce ne sono? quanti record in percentuale
# stai omettendo dal dataframe orginale?
D <- na.omit(D) #in totale eliminiamo 6 obs.

# 4 produci una finestra con tre boxplot SEPARATI per le le tre variabili
par(mfrow=c(1,3))
boxplot(D$imp)
boxplot(D$exc)
boxplot(D$fbk)

# 5 
# normalizza le tre variabili di D con il metodo z-score (funzione "scale")
impZ <- scale(D$imp)
excZ <- scale(D$exc)
fbkZ <- scale(D$fbk)

#6
# fai una matrix plot del data frame D, con i valori normalizzati
newD <- data.frame(impZ, excZ, fbkZ)
plot(newD)

#7
# quale coppia di variabili ? pi? correlata? usa la correlazione di Pearson
cor(newD) #con una correlazione di 0.7782238, la più correlata è impZ con excZ

#8
#crea un modello lineare che preveda la variabile exc in funzione sia di imp chedi fbk
modello1 <- lm(excZ ~ impZ + fbkZ) #excZ in funzione di impZ

#9
# esplora la qualit? del modello
# imp e fbk sono entrambi significativi per la previsione di exc?
summary(modello1) #NO fbkZ non è significativo ai fini della previsione di exc perchè non ha neppure una stella

#10
# realizza un plot x=imp, y=exc
# sovrascrivi con colore diverso al plot i punti "fitted" calcolati dal modello
par(mfrow=c(1,1))
plot(x=impZ, y=excZ)
points(impZ, modello1$fitted.values, pch=18, col="red")
points(excZ, modello1$fitted.values, pch=18, col="blue")

#11
# crea una colonna opt che contenga 1 se la universit? ha exc maggiore di 0
# e 0 altrimenti
newD$opt <- as.numeric(newD$excZ>0)

#12
#realizza un plot x=imp, y=opt
plot(x=newD$impZ, y=newD$opt)

#13
#calcola una regressione logistica che preveda opt usando imp
modelloLogistico <- glm(newD$opt ~ newD$impZ, family = "binomial")

#14
#sovrascrivi al plot precedente i valori calcolati (fitted) dal modello logistico in rosso
points(newD$impZ, modelloLogistico$fitted.values, col="red")

#15
#usando il kmeans con k=2 (due gruppi) e le variabili imp exc e fb dividi le universit?
#in due cluster
k1 <- kmeans(newD[, 1:3], 2)

#16
#realizza un plot x=imp y=exc colorando di rosso il primo gruppo, di blu il secondo 
plot(x=newD$impZ, y=newD$excZ, col=c("red", "blue"))

#17 sapresti dare una intepretazione ai due gruppi creati?

# Sicuramente le facoltà che investono in ricerca hanno un posto in classifica più alto 
# rispetto a quelle che investono meno. Anche se entrambi i tipi di ricerca svolti (riferiti
# alla qualità e alla quantità) fanno crescere linearmente il rank dell'università,
# sembrerebbe che la qualità della ricerca svolta, assicuri in posto più alto in classifica.
# La qualità quindi premia! Sicuramente se dovessi scegliere una facoltà su cui investire la 
# formazione dei miei figli, punterei su chi investe in qualità!