
# Funzione che converte un numero decimale in binario , con l'uso della stringa
def dec2bin(numero):
    digits = ""
    while (numero>=1):
        bin = numero%2
        digits += str(bin)
        numero = int(numero/2)
    return digits[::-1]

def bin2dec(numbin):
    pot,numero = 1,0
    for i in numbin[::-1]:
        numero += int(i)*pot
        pot *= 2
    return numero

def dec2hex(numero):
    hexdigists = "0123456789ABCDEF"
    digits = ""
    while (numero>=1):
        myhex = numero%16
        digits += str(hexdigists[myhex])
        numero = int(numero/16)
    return digits[::-1]

# Versione copilot
# def hex2dec(numhex):
#     hexdigists = "0123456789ABCDEF"
#     pot,numero = 1,0
#     for i in numhex[::-1]:
#         numero += hexdigists.index(i)*pot
#         pot *= 16
#     return numero

# Versione professore
def hex2dec(numero):
    convert = {"0":0, "1":1, "2":2, "3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9, "A":10, "B":11, "C":12, "D":13, "E":14, "F":15}
    result = 0
    pow = 1
    for i in numero[::-1]:
        result += convert[i]*pow
        pow *= 16
    return result

numero = int(input("Inserisci un numero decimale: "))

binario = dec2bin(numero)
print("Il numero trasformato da decimale a binario è: ", binario)
print("Il numero trasformato da binario a decimale è: ", bin2dec(binario))
print("Il numero trasformato da decimale a esadecimale è: ", dec2hex(numero))
print("Il numero trasformato da esadecimale a decimale è: ", hex2dec(dec2hex(numero)))