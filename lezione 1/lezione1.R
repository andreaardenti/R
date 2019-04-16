# Lezione 1 - Script

typeof(2) # per conoscere il tipo - risultato --> DOUBLE
typeof(2L) # risultato --> INTEGER 
typeof("andrea") # risultato --> char
typeof(FALSE) # risultato --> logical
typeof(T) # T è abbreviazione di true
help(TRUE)


# creazione di variabile si usa la freccetta <-
a <- 5
typeof(a)

b = 5 # altro modo per dichiarare una variabile, ma non viene usata dalla comunità scientifica
c <- "ciao"
typeof(c)

d <- TRUE

e <- as.numeric(d) #la variabile e prende il valore booleano di d che vale 1 visto che è true
typeof(e)

f <- as.integer(d) #conversione in integer
typeof(f) 

ls() #mostra l'elenco delle variabili usate
rm(a) #si usa per rimuovere una variabile, tra parentesi va il nome della variabile

#rm(list = ls()) #rimuove la lista che contiene tutte le variabili

#in R l'indice degli array non parte da 0 ma da 1
#creazione di vettore o array
vArray <- c(1, 2, 5, 6, 7, 8)
length(vArray) #lunghezza del vettore
vArray[2] #accesso alla posizione 2 del vettore vArray
vArray[1:3] #mostra un range

vArray[-1] #mostra tutto tranne il primo elemento
vArray+2 #somma 2 ad ogni elemento dell'array
vArray*2 #moltiplica 2 ad ogni elemento dell'array
newArray <- vArray*10

z <- c(1,2,3)
vArray + z #quando sommo due vettori che hanno lunghezza diversa, ricicla il vettore più corto per raggiungere la unghezza di quello più lungo
# 1 2 5 6
# 1 2 3 1 
# 2 4 8 7

peso <- c(56, 58, 59, 57)
nomi <- c("Pina", "Gina", "Lina", "Tina")

names(peso) <- nomi #funzione che associa nomi agli elemnti di un array
peso[2]


a <- seq(1,70) #crea una sequenza di numeri
b <- seq(1,10,3) #sequenza di numeri da 1 a 10 con step 3

dd <- rep (2, 6)
ee <- rep ("ciao", 5)


pi

