è in linguaggio di 40 anni circa
la maggior parte delle applicazioni si connettono nei databese , ma se abbiamo un sito ecommerce vecchio e bisogna creare un applicazione per quel sito , l'unico
modo per dialogare con quel server bisogna usare php

il miglior modo per lavorare con php è lavorare in locale , appena tutto funziona in locale , cambio le variabili di connessione e scarico tutto in remoto

Cosa sono i dns:
è un server 'Domain Name Server'
ogni server ha un IP Univoco

1° livello di domini: .it .tv .web etc
2° livello di dominio: il nome che diamo al sito (ciaociao.it , dadada.com etc.)
3° livello di dominio: associato al nome (gmail.google.com , classroom.google.com)

File host
Local host o 127.0.0.1

database: MySQL

Un database è un foglio excel dove righe e colonne non hanno nessuna identificazione
usando le query possiamo interrogare il database , chiedendo di fare delle cose specifiche

File con connessione a database
File .env

PhPMyAdmin

Aprire la connessione
Lanciare la query
Chiudere la connessione
NON LASCIARE LE QUERY APERTE

Possibili errori:
Pagina bianca
Connessione col database
Problemi di logica

Unico modo per risolvere i problemi di logica è fare il diagramma di flusso

IN PHP

'$nome_variabile' per crearla
$host = 'localhost';
