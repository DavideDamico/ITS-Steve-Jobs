#!/bin/bash

echo "Inserisci il percorso del file"
read file_txt

if [[ ! -f "$file_txt" ]]; then
	echo "Il file $file_txt non esiste. Uscita"
	exit 1
fi

echo "-------------------------------------------------------"
echo "I permessi sono:"
echo "0= non può fare nulla"
echo "1= eseguibile"
echo "2= riscrivere e scrivere"
echo "4= può leggere"
echo "4+1= può leggere e eseguire"
echo "4+2= può leggere e riscrivere e scrivere"
echo "1+2= può eseguire e riscrivere e scrivere"
echo "4+2+1 = può leggere , riscrivere e scrivere e eseguire"
echo "-------------------------------------------------------"
sleep 1

echo "Inserisci permesso per l'utente (owner)"
read owner

if [[ "$owner" =~ ^[0-7]$ ]]; then
	chmod u+"$owner" Perms.txt
	sleep 1
	echo "Permesso modificato"
	else
	echo "Permesso non valido per l'utente. Uscita"
	exit 1
fi

echo "Inserisci permesso per il gruppo"
read group

if [[ "$group" =~ ^[0-7]$ ]]; then
        chmod g+"$group" Perms.txt
	sleep 1
	echo "Permesso modificato"
        else
        echo "Permesso non valido per il gruppo. Uscita"
        exit 1
fi

echo "Inserisci il permesso per gli altri"
read other

if [[ "$other" =~ ^[0-7]$ ]]; then
        chmod o+"$other" Perms.txt
	sleep 1
	echo "Permesso modificato"
        else
        echo "Permesso non valido per altri. Uscita"
        exit 1
fi

echo "2222222 Inserisci il permesso per gli altri"
read other
chmod o+"$other" Perms.txt
echo "Permesso modificato"
