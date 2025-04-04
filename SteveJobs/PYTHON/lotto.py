import random

# Lista delle 11 ruote del Lotto italiano
ruote = ["Bari", "Cagliari", "Firenze", "Genova", "Milano", "Napoli", 
         "Palermo", "Roma", "Torino", "Venezia"]

# Funzione per chiedere all'utente di inserire 5 numeri validi
def scegli_numeri():
    numeri_giocati = set()
    while len(numeri_giocati) < 5:
        try:
            numero = int(input(f"Inserisci il {len(numeri_giocati) + 1}° numero (1-90): "))
            if 1 <= numero <= 90 and numero not in numeri_giocati:
                numeri_giocati.add(numero)
            else:
                print("Numero non valido o già inserito, riprova.")
        except ValueError:
            print("Inserisci un numero valido!")
    return sorted(numeri_giocati)

# Funzione per scegliere la ruota
def scegli_ruota():
    while True:
        ruota = input(f"Scegli una ruota tra: {', '.join(ruote)}\n").capitalize()
        if ruota in ruote:
            return ruota
        print("Ruota non valida, riprova.")

# L'utente sceglie i numeri e la ruota
numeri_giocati = scegli_numeri()
ruota_scelta = scegli_ruota()

# Generazione dell'estrazione SENZA DOPPIONI
lotto = {ruota: sorted(random.sample(range(1, 91), 5)) for ruota in ruote}

# Controllo dei numeri indovinati
numeri_estratti = lotto[ruota_scelta]
numeri_indovinati = set(numeri_giocati) & set(numeri_estratti)

# Mostra il risultato
print("\n🎰 ESTRAZIONE DEL LOTTO 🎰")
for ruota, numeri in lotto.items():
    print(f"{ruota}: {numeri}")

print("\n🎟️ I tuoi numeri giocati:", numeri_giocati)
print(f"📍 Ruota scelta: {ruota_scelta}")
print(f"🔢 Numeri estratti su {ruota_scelta}: {numeri_estratti}")
print(f"✅ Hai indovinato {len(numeri_indovinati)} numeri: {sorted(numeri_indovinati)}" if numeri_indovinati else "❌ Nessun numero indovinato, ritenta!")

