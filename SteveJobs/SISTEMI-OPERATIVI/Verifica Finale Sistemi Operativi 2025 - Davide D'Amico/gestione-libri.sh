#!/bin/bash

# Dichiarazione dell'array che conterrà i libri
books=()

# Controllo se il file archivio_libri.txt esiste , se non esiste crea il file
if [ ! -f archivio_libri.txt ]; then
	touch archivio_libri.txt
fi

#La seguente funzione serve per aggiungere un libro all array dei libri e al file archivio_libri.txt , aggiungendo il libro assieme al titolo , l autore e l anno di pubblicazione. Effettuando i vari controlli 
function aggiungi_libri() {
clear
echo "Quanti libri vuoi inserire?"
read numbLibri
# Controllo se l'input è un numero
if [[ "$numbLibri" =~ ^[0-9]+$ ]]; then
	# Il ciclo for non termina fino a che non ha raggiunto il numero di libri che l'utente vuole inserire
	for (( i=1; i<=numbLibri; i++ ))
	do
		echo "Inserisci il titolo del $i° libro:"
		read titolo
		# Controllo se il titolo contiene solo lettere, numeri e spazi
		if [[ "$titolo" =~ ^[a-zA-Z0-9\ ]+$ ]]; then
			temp1="$titolo"
		else
			echo "Errore: il titolo può contenere solo lettere, numeri e spazi"
			sleep 2
			aggiungi_libri
			break
		fi

		echo "Inserisci l'autore del $i° libro:"
		read autore
		# Controllo se l'autore contiene solo lettere e spazi
		if [[ "$autore" =~ ^[a-zA-Z\ ]+$ ]]; then
			temp2="$autore"
		else
			echo "Errore: l'autore può contenere solo lettere e spazi"
			sleep 2
			aggiungi_libri
			break
		fi

		echo "Inserisci l'anno di pubblicazione del $i° libro"
		read annoPubb
		# Controllo se l'anno di pubblicazione contiene solo numeri di 4 cifre
		if [[ "$annoPubb" =~ ^[0-9]{4}$ ]]; then
			temp3="$annoPubb"
		else
			echo "Errore: l'anno di pubblicazione può contenere solo numeri di 4 cifre"
			sleep 2
			aggiungi_libri
			break
		fi

		# Controllo se il libro è già presente nell'array tramite titolo e autore e se non è presente lo aggiungo all'array e al file archivio_libri.txt
		if [[ ! " ${books[@]} " =~ " ${temp1} " ]] || [[ ! " ${books[@]} " =~ " ${temp2} " ]]; then
			books+=("$temp1" "$temp2" "$temp3")
			echo "$temp1, $temp2, $temp3" >> archivio_libri.txt
			echo "Libro aggiunto con successo"
			sleep 2
		else
			echo "Errore: il libro è già presente nell'archivio"
			sleep 2
		fi
	done
else
	# Se l'input non è un numero, stampo un errore e richiamo la funzione aggiungi_libri
	echo "Errore: inserisci un numero valido"
	sleep 2
	aggiungi_libri
fi
}

#La seguente funzione serve per cercare un libro all'interno del file 'archivio_libri.txt' tramite titolo o autore con l'uso di grep , se cerco tramite autore mi stampa a video tutti i libri di quel autore
function cerca_libro() {
	clear
	echo "Cerca libro per titolo o autore:"
	read cerca
	# Controllo se l'input contiene solo lettere, numeri e spazi
	if [[ "$cerca" =~ ^[a-zA-Z0-9\ ]+$ ]]; then
		# Controllo se il libro è presente nell'archivio
		if grep -q "$cerca" archivio_libri.txt; then
			# Cerco il libro per titolo o autore e stampo a video il libro
			grep -i "$cerca" archivio_libri.txt
			sleep 2
		else
			echo "Libro non trovato"
			sleep 2
		fi
	else
		echo "Errore: il titolo o l'autore può contenere solo lettere, numeri e spazi"
		sleep 2
		cerca_libro
	fi
	sleep 2
}


#La seguente funzione serve per visualizzare tutti i libri presenti nel file archivio_libri.txt
function visualizza_libri() {
clear
echo "Lista libri:"
echo "------------------------------------"
# Controllo se il file archivio_libri.txt è vuoto
if [ -s archivio_libri.txt ]; then
	# Leggo il file archivio_libri.txt e stampo a video i libri
	while read -r line
	do
		echo "- $line"
	done < archivio_libri.txt
else
	echo "Nessun libro presente nell'archivio"
	sleep 2
fi
sleep 2
}

#La seguente funzione serve per ottimizzare l'archivio , ordinando i libri per anno di pubblicazione in ordine crescente e sovrascrivendo il file archivio_libri.txt con i libri ottimizzati
function ottimizza_archivio() {
    clear
    # Controllo se il file archivio_libri.txt è vuoto
    if [ -s archivio_libri.txt ]; then
        # Ordino i libri per anno di pubblicazione in ordine crescente e sovrascrivo il file archivio_libri.txt
        sort -t, -k3n archivio_libri.txt -o archivio_libri.txt
        echo "Archivio ottimizzato con successo"
        sleep 2
    else
        echo "Nessun libro presente nell'archivio"
        sleep 2
    fi
}

# Funzione per il menu
function menu(){
clear
echo "Benvenuto nell'archivio libri!"
echo "------------------------------------"
echo "1. Aggiungi un libro"
echo "2. Cerca un libro"
echo "3. Visualizza tutti i libri"
echo "4. Ottimizza archivio"
echo "5. Esci"
}

while true
do
menu
echo "------------------------------------"
read -p "Inserisci la tua scelta (1-5):" scelta

# Controllo se l'input è un numero
if [[ "$scelta" =~ ^[1-5]$ ]]; then
	case $scelta in
		1)
		aggiungi_libri
		;;
		2)
		cerca_libro
		;;
		3)
		visualizza_libri
		;;
		4)
		ottimizza_archivio
		;;
		5)
		echo "Uscita dal programma. Grazie"
		break
		;;
	esac
else
	# Se l'input non è un numero, stampo un errore
	echo "Scelta non valida. Inserisci un numero tra 1 e 5"
	sleep 2
fi
done