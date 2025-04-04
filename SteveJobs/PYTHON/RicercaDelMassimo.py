# Algortimo di ricerca del massimo
# In una lista di valori positivi o null

# 1. Inserisci una lista dei valori >= 0 MyList
# 2. maxtemp = 0
# 3. Scansione del primo all'ultimo valore di MyList
# 3.1 Se maxtemp < valore in MyList allora maxtemp = valore di MyList
# 4. Stampa il massimo di MyList che è contenuto in maxtemp

# Esempio
# def ricercaDelMassimo(MyList):
#     maxtemp = 0
#     for i in MyList:
#         if maxtemp < i:
#             maxtemp = i
#     return maxtemp

# MyList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# print("Il massimo di MyList è: ", ricercaDelMassimo(MyList))

# MyList = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
# print("Il massimo di MyList è: ", ricercaDelMassimo(MyList))

# MyList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100]
# print("Il massimo di MyList è: ", ricercaDelMassimo(MyList))

# valore = input("Inserisci un numero: ")

# # Controllo se il valore è un numero o una lettera , se un numero lo trasformo in intero
# while not valore.isdigit():
#     valore = input("Inserisci un numero: ")

# valore = int(valore)

from random import randint

def mymax(mialista):
    maxtemp = 0
    counter = 0
    maxind= 0

    for item in Mylist: #for(i=0, i<len(Mylist), i++)
        if maxtemp < item:
            maxtemp = item
            maxind = counter
        counter += 1

    return maxtemp, maxind

# Mylist = [randint(0, 9) for i in range(10)]

Mylist = []

for i in range(5):
    while True:
        valore = input("Inserisci un numero: ")
        if (valore.isdecimal() and int(valore) not in Mylist):
            Mylist.append(int(valore))
            print(Mylist)
            break
        else:
            print("Il numero è già presente nella lista")

print("La lista è: ", Mylist)

massimo,indmax = mymax(Mylist)

print("Il massimo è: ", massimo, " alla posizione: ", indmax)