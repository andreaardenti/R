# prova in itinere Catania 15 marzo 2019

# studente
# COGNOME <- ARDENTI
# NOME <- ANDREA

# 0
# ottieni la cartella dati moscaMarathon

# 1
# importa i dati "percorso.csv"
percorso <- read.csv("~/Desktop/Esercitazioni/R/itinere/moscaMarathon/percorso.csv")

# 2
# Essi rappresentano le coordinate dei percorsi delle due gare corse a Mosca nel 2018
# Una ? la corsa di 10km, una ? la maratona di 42 km
# Estrai da percorso un nuovo dataframe PM con solo due variabili: latitutine e longitudine relative 
# SOLO al percorso della maratona di 42 km
df <- data.frame(percorso$longitude, percorso$latitude)
PM <- df[196:1319,]

# 3
# Estrai da percorso un nuovo dataframe P10 con solo due variabili: latitutine e longitudine relative 
# SOLO al percorso della maratona di 10 km
P10 <- PM[1:195,]

# 4 
# produci un plot ove il percorso sia rappresentato da una linea 
# spezzata che passa per tutti i punti di PM
# Il rapporto di aspetto (aspect ratio) del plot deve essere 1:1 
# La linea deve essere rossa e di spessore 3 pixel
# il titolo del plot sia "percorso" e le etichette sugli assi siano 
# latitudine e longitudine
plot(PM, type="l", main='ratio = 1', asp=1) 

# 5
# sovrascrivi al plot precedente una spezzata di colore blu e spessore 
# 5 pixel che tracci il percorso della 10 km
points(P10, type="l", lwd=5, col="blue" )

# 6
# importa i dati "tempi.csv"
tempi <- read.csv("~/Desktop/Esercitazioni/R/itinere/moscaMarathon/tempi.csv")
tempi <- na.omit(tempi) #toglie i record senza valore

# 7
# estrai un nuovo dataframe tempo con sole variabili
# tot = finish_time_sec (tempo finale in secondi)
# half = half_pace_sec*21.095 (tempo in secondi per la mezza maratona)
# genere = gender_eng (genere del runner)
tempo <- data.frame(tot=tempi$finish_time_sec, half=tempi$half_pace_sec*21.095, genere=tempi$gender_en)

# 8
# produci un plot con due sottoplot
# nel primo metterai l'istogramma di tot relativo ai maschi
# nel secondo l'istogramma di tot relativo alle femmine
# i due istogrammi debbono avere lo stesso numero di bin
par(mfrow=c(1,2))
tempomaschi <- tempo$tot[tempo$genere=="Male"]
tempofemmine <- tempo$tot[tempo$genere=="Female"]
hist(tempomaschi)
hist(tempofemmine)

# 9 
# produci un plot con un unica finestra nella quale compare
# la density dei tempi tot dei maschi in blu e sovrapposta
# la density dei tempi tot delle femmine
# la bdw deve essere uguale per tutti e due i grafici
par(mfrow=c(1,1))
plot(density(tempomaschi, bw=500), col="blue")
points(density(tempofemmine, bw=500), type="l")

# 10
# da tempo estrai il dataframe TM relativo solo ai runner maschi
# con solo due variabili
# h = punteggio z-score del runner sul tempo della mezza maratona
# f = punteggio z-score del runner sul tempo della maratona
TM <- data.frame(h=scale(tempo$half[tempo$genere=="Male"]), f=scale(tempo$tot[tempo$genere=="Female"]))

# 11
# realizza un plot con x=h e y=f
plot(TM$h, TM$f)

# 13
# come sono correlati gli score della maratona con quelli della mezza?

# 14
# crea un modello di regressione lineare per prevedere lo score della maratona
# a partire da quello della mezza.

# 15 nel plot precedente traccia la retta di regressione ottenuta

# 16 
# esplora la validità del modello proposto
