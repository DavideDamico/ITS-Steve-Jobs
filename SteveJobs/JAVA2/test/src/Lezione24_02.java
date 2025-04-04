// TipiDiDato ------------------------------------

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         int numero = 10;
//         double prezzo = 9.99;
//         char lettera = 'A';
//         boolean accesso = true;

//         System.out.println("Numero: " + numero);
//         System.out.println("Prezzo: " + prezzo);
//         System.out.println("Lettera: " + lettera);
//         System.out.println("Accesso: " + accesso);
//     }
// }

// SommaNumeri ------------------------------------

// import java.util.Scanner;

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         Scanner scanner = new Scanner(System.in);
//         System.out.print("Inserisci il primo numero: ");
//         int numero1 = scanner.nextInt();

//         System.out.print("Inserisci il secondo numero: ");
//         int numero2 = scanner.nextInt();

//         int somma = numero1 + numero2;

//         System.out.println("La somma dei due numeri è: " + somma);
//         scanner.close();
//     }
// }

// Blocchi di codice -----------------------------------

// if (true) {
//     System.out.println("Questo codice è dentro un blocco!");
// }

// Metodi

// public class Lezione24_02 {
//     public static void saluta() {
//         System.out.println("Ciao, benvenuto in Java!");
//     }
//     public static void main(String[] args) {
//         saluta(); // Chiamata al metodo
//     }
// }

// ControlloFlusso ------------------------------------

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         int numero = 10;
//         if (numero > 0) {
//             System.out.println("Il numero è positivo!");
//         } else {
//             System.out.println("Il numero è negativo o zero!");
//         }
//     }
// }

// Esercizio 1 -----------------------------------------

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         int età = 18;
//         double altezza = 1.80;
        
//         System.out.println("L'età è: " + età);
//         System.out.println("L'altezza è: " + altezza);
//     }
// }

// Esercizio 2 -----------------------------------------

// import java.util.Scanner;

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         Scanner scanner = new Scanner(System.in);

//         System.out.print("Inserisci il primo numero: ");
//         int numero1 = scanner.nextInt();

//         System.out.print("Inserisci il secondo numero: ");
//         int numero2 = scanner.nextInt();

//         int somma = numero1 + numero2;
//         int differenza = numero1 - numero2;
//         int prodotto = numero1 * numero2;

//         System.out.println("La somma è: " + somma);
//         System.out.println("La differenza è: " + differenza);
//         System.out.println("Il prodotto è: " + prodotto);
//         scanner.close();
//     }
// }

// Esercizio 3 -----------------------------------------

// import java.util.Scanner;

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         Scanner scanner = new Scanner(System.in);

//         System.out.print("Inserisci la tua età: ");
//         int età = scanner.nextInt();

//         if (età >= 18) {
//             System.out.print("Puoi guidare");
//         } else {
//             System.out.print("Non puoi guidare");
//         }
//         scanner.close();
//     }
// }

// Esercizio 4 -----------------------------------------

// All'uso modificare il nome della class

// public class Persona {
//     public static void saluta() {
//         System.out.print("Ciao, sono una persona!");
//     }

//     public static void main(String[] args) {
//         saluta();
//     }
// }

// TipiPrimitivi --------------------------------------

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         for(int i = 0; i < 5; i++) {
//             byte piccoloNumero = (byte)(i + 10);
//             short numeroBreve = (short)(i * 20);
//             int numeroIntero = i * 1000;
//             long numeroLungo = i * 1000000L;
//             float numeroDecimale = i * 1.5f;
//             double numeroPreciso = i * 9.99;
//             char lettera = (char)('A' + i);
//             boolean valoreLogico = (i % 2 == 0);
//             System.out.println("Ciclo " + i + ": " + piccoloNumero + ", " + numeroBreve + ", " + numeroIntero + ", " + numeroLungo + ", " + numeroDecimale + ", " + numeroPreciso + ", " + lettera + ", " + valoreLogico);
//         }
//     }
// }

// ScopeTest ------------------------------------------

// public class Lezione24_02 {
//     private int variabileIstanza = 0;
//     private static int variabileStatic = 0;

//     public void incrementaVariabili() {
//         int variabileLocale = 0;
//         for (int i = 0; i < 3; i++) {
//             variabileLocale++;
//             variabileIstanza++;
//             variabileStatic++;
//             System.out.println("Ciclo: " + i + " - Locale: " + variabileLocale + ", Istanza: " + variabileIstanza + ", Static: " + variabileStatic);
//         }
//     }

//     public static void main(String[] args) {
//         Lezione24_02 scopeTest = new Lezione24_02();
//         scopeTest.incrementaVariabili();
//     }
// }

// ShortCircuitTest

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         for (int i = 0; i < 5; i++) {
//             boolean result = (i > 2) && metodoCostoso(i);
//             System.out.println("Ciclo " + i + ", risultato: " + result);
//         }
//     }

//     public static boolean metodoCostoso(int i){
//         System.out.println("metodoCostoso() chiamato con i = " + i);
//         return i % 2 == 0;
//     }
// }

// CastingTest

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         for (int i = 1; i <= 3; i++) {
//             double valore = i * 9.99;
//             int valoreIntero = (int)valore;
//             System.out.println("Ciclo " + i + ": " + valore + " , Valore intero -> " + valoreIntero);
//         }
//     }
// }

// Esercizio 1.2 ---------------------------------------

// public class Lezione24_02 {
//     public static void main(String[] args) {
//         byte piccoloNumero = 10;
//         short numeroBreve = 1000;
//         int numeroIntero = 1000000;
//         long numeroLungo = 1000000000L;
//         float numeroDecimale = 9.99f;
//         double numeroPreciso = 9.99;
//         char lettera = 'A';
//         boolean valoreLogico = true;

//         System.out.println("Byte: " + piccoloNumero);
//         System.out.println("Short: " + numeroBreve);
//         System.out.println("Int: " + numeroIntero);
//         System.out.println("Long: " + numeroLungo);
//         System.out.println("Float: " + numeroDecimale);
//         System.out.println("Double: " + numeroPreciso);
//         System.out.println("Char: " + lettera);
//         System.out.println("Boolean: " + valoreLogico);

//         for (int i = 0; i < 2; i++){
//             piccoloNumero = (byte)(piccoloNumero + i);
//             numeroBreve = (short)(numeroBreve + i);
//             numeroIntero = numeroIntero + i;
//             numeroLungo = numeroLungo + i;
//             numeroDecimale = numeroDecimale + i;
//             numeroPreciso = numeroPreciso + i;
//             lettera = (char)(lettera + i);
//             valoreLogico = !valoreLogico;
//         }
//         System.out.println("Nuovi valori dopo il ciclo:");
//         System.out.println("Byte: " + piccoloNumero);
//         System.out.println("Short: " + numeroBreve);
//         System.out.println("Int: " + numeroIntero);
//         System.out.println("Long: " + numeroLungo);
//         System.out.println("Float: " + numeroDecimale);
//         System.out.println("Double: " + numeroPreciso);
//         System.out.println("Char: " + lettera);
//         System.out.println("Boolean: " + valoreLogico);

//     }
// }

// Esercizio Finale -----------------------------------

import java.util.Scanner;

public class Lezione24_02 {

    public static void somma(int numero1, int numero2) {
        int somma = numero1 + numero2;
        System.out.println("La somma è: " + somma);
    }

    public static void differenza(int numero1, int numero2) {
        int differenza = numero1 - numero2;
        System.out.println("La differenza è: " + differenza);
    }

    public static void prodotto(int numero1, int numero2) {
        int prodotto = numero1 * numero2;
        System.out.println("Il prodotto è: " + prodotto);
    }

    public static void divisione(int numero1, int numero2) {
        double divisione = (double)numero1 / numero2;
        System.out.println("La divisione è: " + divisione);
    }

    public static void maggiore(int numero1, int numero2) {
        if (numero1 > numero2) {
            System.out.println("Il primo numero è maggiore!");
        } else if (numero2 > numero1) {
            System.out.println("Il secondo numero è maggiore!");
        } else {
            System.out.println("I due numeri sono uguali!");
        }
    }

    public static void diversi(int numero1, int numero2) {
        if (numero1 != numero2) {
            System.out.println("I due numeri sono diversi!");
        } else {
            System.out.println("I due numeri sono uguali!");
        }
    }

    public static void somma2(double numero1, byte numero2) {
        Object somma = numero1 + numero2;
        System.out.println("La somma è: " + somma);
    }

    public static void differenza2(double numero1, byte numero2) {
        Object differenza = numero1 - numero2;
        System.out.println("La differenza è: " + differenza);
    }

    public static void prodotto2(double numero1, byte numero2) {
        Object prodotto = numero1 * numero2;
        System.out.println("Il prodotto è: " + prodotto);
    }

    public static void divisione2(double numero1, byte numero2) {
        Object divisione = numero1 / numero2;
        System.out.println("La divisione è: " + divisione);
    }

    public static void maggiore2(double numero1, byte numero2) {
        if (numero1 > numero2) {
            System.out.println("Il primo numero è maggiore!");
        } else if (numero2 > numero1) {
            System.out.println("Il secondo numero è maggiore!");
        } else {
            System.out.println("I due numeri sono uguali!");
        }
    }

    public static void diversi2(double numero1, byte numero2) {
        if (numero1 != numero2) {
            System.out.println("I due numeri sono diversi!");
        } else {
            System.out.println("I due numeri sono uguali!");
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Inserisci ii primo numero: ");
        int numero1 = scanner.nextInt();

        System.out.print("Inserisci il secondo numero: ");
        int numero2 = scanner.nextInt();

        somma(numero1, numero2);
        differenza(numero1, numero2);
        prodotto(numero1, numero2);
        divisione(numero1, numero2);
        maggiore(numero1, numero2);
        diversi(numero1, numero2);
        
        System.out.println();
        System.out.print("Valori dopo la conversione: ");
        System.out.println();
        
        double numero1Double = (double)numero1;
        byte numero2Byte = (byte)numero2;

        somma2(numero1Double, numero2Byte);
        differenza2(numero1Double, numero2Byte);
        prodotto2(numero1Double, numero2Byte);
        divisione2(numero1Double, numero2Byte);
        maggiore2(numero1Double, numero2Byte);
        diversi2(numero1Double, numero2Byte);
        scanner.close();
    }
}