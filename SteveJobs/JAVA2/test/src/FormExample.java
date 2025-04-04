import java.util.Scanner;

public class FormExample {
    public static void main(String[] args) {
        // Creiamo un oggetto Scanner per leggere i dati da input
        Scanner scanner = new Scanner(System.in);

        // Introduzione
        System.out.println("Benvenuto nel form di inserimento dati!");

        // Creazione del form
        System.out.print("Inserisci il tuo nome: ");
        String nome = scanner.nextLine();

        System.out.print("Inserisci la tua età: ");
        int eta = scanner.nextInt(); // Legge un intero

        scanner.nextLine(); // Consuma la newline rimasta dopo nextInt()

        System.out.print("Inserisci il tuo indirizzo email: ");
        String email = scanner.nextLine();

        // Stampiamo i dati inseriti
        System.out.println("\nDati inseriti:");
        System.out.println("Nome: " + nome);
        System.out.println("Età: " + eta);
        System.out.println("Email: " + email);

        // Chiudiamo lo scanner
        scanner.close();
    }
}
