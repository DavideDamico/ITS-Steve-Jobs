# Tipi Fondamentali

## Char

CHAR è il tipo carattere. Tipicamente vengono codificati i caratteri in ASCII. Il char può anche essere
utilizzato per memorizzare un byte.
Il tipo char per default è equivalente a signed char. In molti compilatori esiste un'opzione per mezzo della
quale si puo' cambiare il default a unsigned char. In ogni caso il tipo può essere specificato come:
[ signed | unsigned ] char
Nel caso che il tipo venga specificato come signed char o unsigned char, questo prevale sul default assunto
durante la compilazione.

TIPO RANGE DI VALORI BYTE
char -128 ... 127 1
unsigned char 0 ... 255 1

### Caratteri speciali:

CARATTERE CODIFICA
Newline \n
Tab \t
Backspace \b
Form feed \f
Carriage return \r
Null \0

## INT

INT è il tipo numero intero e vengono allocati in memoria generalmente 2 o 4 byte a seconda
dell'implementazione del compilatore e dell'architettura del sistema (16 o 32 bit). I numeri interi possono
essere memorizzati/manipolati con o senza segno. Si possono impiegare i termini short o long per forzare
l'intero alla minima o massima dimensione ammessa. Possono essere utilizzate le parole chiave signed e
unsigned per specificare se il tipo sia dotato o no di segno. Per default i numeri interi sono con segno.

### Sintassi ammessa:

[ signed | unsigned ] short [ int ]
[ signed | unsigned ] int
[ signed | unsigned ] long [ int ]
