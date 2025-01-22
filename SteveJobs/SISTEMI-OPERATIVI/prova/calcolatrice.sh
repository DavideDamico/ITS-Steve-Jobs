#!/bin/bash


function addizione(){
clear
echo "Quanti valori vuoi sommare?"
read n
if [[ "$n" =~ ^[0-9]+$ ]]; then
	somma=0
	for (( i=1; i<=n; i++ ))
	do
        	echo "inserisci il valore $i:"
        	read val
        		if [[ "$val" =~ ^[0-9]+$ ]]; then
        			somma=$((somma + val))
        		else
        			echo "Valore non valido"
				sleep 2
				addizione
				break
			fi
	done
	echo "Risultato dell'addizione: $somma"
        read -p "Premi invio per continuare..."
else
	echo "Valore non valido"
	sleep 2
	addizione
fi
}


function sottrazione(){
clear
echo "Quanti valori vuoi sottrarre?"
read n
if [[ "$n" =~ ^[0-9]+$ ]]; then
        sottrazione=0
        for (( i=1; i<=n; i++ ))
        do
                echo "inserisci il valore $i:"
                read val
                        if [[ "$val" =~ ^[0-9]+$ ]]; then
				if [[ $i -eq 1 ]]; then 
                                	sottrazione=$((val))
				else
					sottrazione=$((sottrazione - val))
				fi
                        else
                                echo "Valore non valido"
				sleep 2
				sottrazione
                                break
                        fi
        done
        echo "Risultato della sottrazione: $sottrazione"
        read -p "Premi invio per continuare..."
else
        echo "Valore non valido"
	sleep 2
	sottrazione
fi
}


function moltiplicazione(){
clear
echo "Quanti valori vuoi moltiplicare?"
read n
if [[ "$n" =~ ^[0-9]+$ ]]; then
	moltiplicazione=0
	for (( i=1; i<=n; i++ ))
        do
                echo "inserisci il valore $i:"
                read val
                        if [[ "$val" =~ ^[0-9]+$ ]]; then
                                if [[ $i -eq 1 ]]; then
                                        moltiplicazione=$((val))
                                else
                                        moltiplicazione=$((moltiplicazione * val))
                                fi
                        else
                                echo "Valore non valido"
				sleep 2
				moltiplicazione
                                break
                        fi
        done
        echo "Risultato della moltiplicazione: $moltiplicazione"
        read -p "Premi invio per continuare..."
else
        echo "Valore non valido"
	sleep 2
	moltiplicazione
fi
}


function divisione(){
clear
echo "Quanti valori vuoi dividere?"
read n
if [[ "$n" =~ ^[0-9]+$ ]]; then
        divisione=0
        for (( i=1; i<=n; i++ ))
        do
                echo "inserisci il valore $i:"
                read val
                        if [[ "$val" =~ ^[0-9]+$ ]]; then
                                if [[ $i -eq 1 ]]; then
                                        divisione=$((val))
                                else
					if [[ "$val" = [0] ]]; then
					echo "Divisione impossibile"
					sleep 2
					divisione
					break
					else
                                        	divisione=$((divisione / val))
                                	fi
				fi
                        else
                                echo "Valore non valido"
				sleep 2
				divisione
                                break
                        fi
        done
        echo "Risultato della divisione: $divisione"
        read -p "Premi invio per continuare..."
else
        echo "Valore non valido"
	sleep 2
	divisione
fi
}


function menu(){
clear
echo "Scegli un'operazione da eseguire"
echo "1)Addizione"
echo "2)Sottrazione"
echo "3)Moltiplicazione"
echo "4)Divisione"
echo "5)Esci"
}

# Ciclo principale del programma
while true
do
menu
read -p "Inserisci la tua scelta (1-5):" operazione

# Controllo dell'input per validità
if [[ "$operazione" =~ ^[1-5]$ ]]; then
	case $operazione in
		1)
		addizione
		;;
		2)
		sottrazione
		;;
		3)
		moltiplicazione
		;;
		4)
		divisione
		;;
		5)
		echo "Uscita dal programma. Grazie"
		break
		;;
	esac

else
	echo "Scelta non valida. Inserisci un numero tra 1 e 5"
	sleep 2

fi
done

