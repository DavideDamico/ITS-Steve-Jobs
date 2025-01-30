#!/bin/bash

echo "Inserire il nome del file da creare"
read nome_file

if [[ ! -f "$nome_file" ]]; then
	touch "$nome_file"
	echo "Il file $nome_file è stato creato"
else
	echo "Questo file esiste già"
	exit 1
fi
echo "                        "

while [ "$testo_riga" != "fine" ]
do
echo "Aggiungi una riga (scrivi 'fine' per terminare):"
read testo_riga

if [[ "$testo_riga" == "fine" ]]; then
        break
else
	echo "$testo_riga" >> "$nome_file"
        echo "-> Riga aggiunta"
fi
done
sleep 1
echo "                         "

echo "Contenuto del file"
echo "-----------------------------"
cat "$nome_file"
echo "-----------------------------"
echo "                              "

echo "Statistiche del file"
righe=$(wc -l < $nome_file)
echo "Righe: $righe"
parole=$(wc -w < $nome_file)
echo "Parole: $parole"
caratteri=$(wc -m < $nome_file)
echo "Caratteri: $caratteri"
sleep 1

echo "Inserisci il nome per la copia del file"

