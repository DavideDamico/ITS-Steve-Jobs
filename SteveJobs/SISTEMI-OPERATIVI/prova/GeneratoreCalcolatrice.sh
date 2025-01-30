#!/bin/bash

echo "Inserisci il percorso del file .txt"
read file_txt

if [[ ! -f "$file_txt" ]]; then
	echo "Il file $file_txt non esiste. Uscita"
	exit 1
fi

contenuto=$(<"$file_txt")

echo "Contenuto del file letto"
echo "------------------------"
echo "$contenuto"
echo "------------------------"

echo "Premi INVIO per continuare e salvare il contenuto come file .sh"
read

echo "$contenuto" > NewCalcolatrice.sh

chmod +x NewCalcolatrice.sh

echo "Il file NewCalcolatrice.sh è stato creato ed è eseguibile"

echo "Eseguo il file generato..."
sleep 2

./NewCalcolatrice.sh
