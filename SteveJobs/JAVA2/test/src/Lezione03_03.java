// Calcolatrice con switch case

// import java.util.Scanner;

// public class Lezione03_03 {
//     public static void main(String[] args) {
//         Scanner scanner = new Scanner(System.in);

//         System.out.println("--MENU OPERAZIONI--");
//         System.out.println("1. Addizione");
//         System.out.println("2. Sottrazione");
//         System.out.println("3. Moltiplicazione");
//         System.out.println("4. Divisione");
//         int operazione = scanner.nextInt();

//         System.out.println();

//         System.out.println("Inserisci il primo numero: ");
//         double num1 = scanner.nextDouble();

//         System.out.println("Inserisci il secondo numero: ");
//         double num2 = scanner.nextDouble();

//         double risultato = 0;

//         switch (operazione) {
//             case 1:
//                 risultato = num1 + num2;
//                 System.out.println("Il risultato dell'addizione è: " + String.format("%.2f", risultato));
//                 break;
//             case 2:
//                 risultato = num1 - num2;
//                 System.out.println("Il risultato della sottrazione è: " + String.format("%.2f", risultato));
//                 break;
//             case 3:
//                 risultato = num1 * num2;
//                 System.out.println("Il risultato della moltiplicazione è: " + String.format("%.2f", risultato));
//                 break;
//             case 4:
//                 risultato = num1 / num2;
//                 System.out.println("Il risultato della divisione è: " + String.format("%.2f", risultato));
//                 break;
//             default:
//                 System.out.println("Operazione non valida , inserisci un numero da 1 a 4");
//                 break;
//         }
//         scanner.close();
//     }
// }

// Ciclo for tabellina

// import java.util.Scanner;

// public class Lezione03_03 {
//     public static void main(String[] args) {
//         Scanner scanner = new Scanner(System.in);

//         System.out.println("Inserisci il numero di cui vuoi la tabellina: ");
//         int num = scanner.nextInt();

//         int risultato = 0;
//         for (int i = 1; i <= 10; i++) {
//             risultato = num * i;
//             System.out.println(num + " x " + i + " = " + risultato);
//         }
//         scanner.close();
//     }
// }

// Ciclo while somma numeri N

// import java.util.Scanner;

// public class Lezione03_03 {
//     public static void main(String[] args) {
//         Scanner scanner = new Scanner(System.in);

//         System.out.println("Inserisci il numero N: ");
//         int num = scanner.nextInt();

//         int risultato = 0;
//         int i = 1;
//         while (i <= num) {
//             risultato = risultato + i;
//             i++;
//         }

//         System.out.println("Il risultato della somma dei numeri fino a " + num + " è: " + risultato);
//         scanner.close();
//     }
// }

// Ciclo do while controllo password

// import java.util.Scanner;

// public class Lezione03_03 {
//     public static void main(String[] args) {
//         Scanner scanner = new Scanner(System.in);

//         String password = "java123";
//         String inputUtente = "";

//         do {
//             System.out.println("Inserisci la password: ");
//             inputUtente = scanner.nextLine();

//             if (inputUtente.equals(password)) {
//                 System.out.println("Password corretta");
//                 break;
//             } else {
//                 System.out.println("Password errata, riprova");
//             }
//         } while (inputUtente != password);
//         scanner.close();
//     }
// }

// Dichiarazione , modifica , iterazione , modifica lunghezza array

// public class Lezione03_03 {
//     public static void main(String[] args) {
//         int[] numeri = new int[5];
//         numeri[0] = 10;
//         numeri[1] = 20;
//         numeri[2] = 30;
//         numeri[3] = 40;
//         numeri[4] = 50;

//         int[] numeri2 = { 10, 20, 30, 40, 50 };

//         // Iterazione array numeri
//         System.out.println("Numeri");
//         for (int i = 0; i < numeri.length; i++) {
//             System.out.println(numeri[i]);
//         }

//         System.out.println();

//         // Iterazione array numeri2
//         System.out.println("Numeri2");
//         for (int i = 0; i < numeri2.length; i++) {
//             System.out.println(numeri2[i]);
//         }

//         // For each
//         // for (int numero : numeri) {
//         //     System.out.println(numero);
//         // }

//         // for (int numero : numeri2) {
//         //     System.out.println(numero);
//         // }

//         // Modifica valore elementi array 'numeri'
//         numeri[0] = 100;
//         numeri[1] = 200;
//         numeri[2] = 300;
//         numeri[3] = 400;
//         numeri[4] = 500;

//         System.out.println();

//         System.out.println("New Numeri");
//         for (int i = 0; i < numeri.length; i++) {
//             System.out.println(numeri[i]);
//         }
        
//         // Modifica valore elementi array 'numeri2'
//         numeri2[0] = 1000;
//         numeri2[1] = 2000;
//         numeri2[2] = 3000;
//         numeri2[3] = 4000;
//         numeri2[4] = 5000;

//         System.out.println();

//         System.out.println("New Numeri2");
//         for (int i = 0; i < numeri2.length; i++) {
//             System.out.println(numeri2[i]);
//         }

//         // Modifica lunghezza array
//         int[] numeri3 = new int[numeri.length + 1];
//         System.arraycopy(numeri, 0, numeri3, 0, numeri.length);

//         // Aggiunta di un nuovo valore , elemento 60
//         numeri3[numeri3.length - 1] = 60;

//         // Aggiorniamo il riferimento dell'array numeri
//         numeri = numeri3;

//         System.out.println();

//         System.out.println("New Numeri Aggiornato");
//         for (int i = 0; i < numeri.length; i++) {
//             System.out.println(numeri[i]);
//         }
//     }
// }
