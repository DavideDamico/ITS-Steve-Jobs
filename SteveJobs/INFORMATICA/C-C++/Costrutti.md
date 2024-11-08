# Costrutto IF

Consente di eseguire una o più istruzioni se (if) una condizione è vera

# COSTRUTTO FOR

L’impiego principale del costrutto FOR è quello di ripetere un blocco di istruzioni per
un numero finito di volte. La “condizione” del costrutto FOR contiene tre parti:

```javascript
for (inizializzazione; condizione; incremento) {
  istruzioni;
}
```

- ## Inizializzazione

  viene svolta solo all’inizio e contiene tipicamente una variabile
  utilizzata per il conteggio a cui viene assegnato un valore di
  partenza, esempio i=0

- ## Condizione

  Contiene la condizione di permanenza nel ciclo for. Quando la
  condizione diventa falsa il ciclo si interrompe, esempio i<10

- ## Incremento
  Tipicamente contiene l’operazione di incremento del
  contatore, esempio i++

Tipica forma:

```javascript
for (i = 0; i < 10; i++) {
  console.log("Ciao");
}
```

Si può utilizzare nel blocco con le istruzioni da ripetere ciclicamente l'istruzione **break**; qualora occorre interrompere anticipatamente il cilco FOR
