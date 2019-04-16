# Lezione 2 - Script

annoNascita <- 72
typeof(annoNascita)

a <- c(1,2,3,4L) #fa la conversione del long in double per non perdere informazioni
typeof(a[3])

d <- c(1, TRUE) #altra conversione
typeof(d)

# le conversioni vengono fatte nel tipo più possibile per non avere perdite di informazioni. 
# tutto cmq verrà convertito in un tipo unico (array non può essere non omogeneo)


# ----------LISTE----------
#per gestire dati non omogenei

lista <- list("a", 3L, pi)
listaDue <- list(c(1,2,3), c(4,5,6))

lista[1] #stampa il primo elemento della lista
listaDue[1] #tampa il primo elemento di listaDue ...che è un array, quindi stampa l'intero array

listaDue[[1]][1] #stampa il primo valore del primo elemento che è un array, quindi devo accedere all'array con le doppie quadre

summary(lista) #funzione generica - ottiene informazioni
summary(listaDue)

newArray <- c(1,2,3)
summary(newArray)

# ------------------DATA FRAME---------------------
# il dataframe è una tabella
# è composto da colonne e ogni colonna può contenere una informazione diversa
# le righe si chiamano OBSERVATION
# le colonne si chiamanoo VARIABILI

nome <- c("Piero", "Paolo", "Andrea", "Giovanni", "Lorenzo")
peso <- c(74, 81, 78, 68, 43)
altezza <- c(180, 160, 145, 165, 175)
d <- data.frame(nome, peso)
summary(d)

barplot(peso)
plot(peso, type = "o")

cor.test(peso, altezza)


