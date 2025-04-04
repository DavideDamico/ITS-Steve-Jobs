import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ComplexFormExample {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Introduzione
        System.out.println("Benvenuto nel form di registrazione!");

        // Dati del form
        String nome = getNome(scanner);
        int eta = getEta(scanner);
        String email = getEmail(scanner);
        String password = getPassword(scanner);

        // Conferma
        System.out.println("\nI dati che hai inserito sono:");
        System.out.println("Nome: " + nome);
        System.out.println("Età: " + eta);
        System.out.println("Email: " + email);

        // Chiedi conferma all'utente prima di inviare i dati
        System.out.print("\nVuoi inviare questi dati? (S/N): ");
        String conferma = scanner.nextLine().toUpperCase();

        if (conferma.equals("S")) {
            System.out.println("\nDati inviati con successo!");
            // Salvataggio dei dati nel file
            saveToFile(nome, eta, email, password);
        } else {
            System.out.println("\nI dati non sono stati inviati.");
        }

        // Chiudiamo lo scanner
        scanner.close();
    }

    // Funzione per ottenere il nome
    private static String getNome(Scanner scanner) {
        String nome;
        while (true) {
            System.out.print("Inserisci il tuo nome: ");
            nome = scanner.nextLine();
            if (nome.trim().isEmpty()) {
                System.out.println("Il nome non può essere vuoto. Riprova.");
            } else {
                break;
            }
        }
        return nome;
    }

    // Funzione per ottenere l'età
    private static int getEta(Scanner scanner) {
        int eta = -1;
        while (eta < 18 || eta > 100) {
            System.out.print("Inserisci la tua età (18-100): ");
            if (scanner.hasNextInt()) {
                eta = scanner.nextInt();
                scanner.nextLine(); // Consuma la newline
                if (eta < 18 || eta > 100) {
                    System.out.println("Età non valida. L'età deve essere tra 18 e 100.");
                }
            } else {
                System.out.println("Inserisci un numero valido per l'età.");
                scanner.nextLine(); // Consuma la linea errata
            }
        }
        return eta;
    }

    // Funzione per ottenere l'email con validazione
    private static String getEmail(Scanner scanner) {
        String email;
        while (true) {
            System.out.print("Inserisci il tuo indirizzo email: ");
            email = scanner.nextLine();
            if (isValidEmail(email)) {
                break;
            } else {
                System.out.println("Email non valida. Riprova.");
            }
        }
        return email;
    }

    // Funzione per validare l'email con regex
    private static boolean isValidEmail(String email) {
        String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    // Funzione per ottenere la password
    private static String getPassword(Scanner scanner) {
        String password;
        while (true) {
            System.out.print("Inserisci una password (minimo 6 caratteri): ");
            password = scanner.nextLine();
            if (password.length() >= 6) {
                break;
            } else {
                System.out.println("La password deve essere di almeno 6 caratteri.");
            }
        }
        return password;
    }

    // Funzione per salvare i dati in un file
    private static void saveToFile(String nome, int eta, String email, String password) {
        String fileName = "dati_utenti.txt";
        try (FileWriter writer = new FileWriter(fileName, true)) {
            writer.write("Nome: " + nome + "\n");
            writer.write("Età: " + eta + "\n");
            writer.write("Email: " + email + "\n");
            writer.write("Password: " + password + "\n");
            writer.write("------------\n");

            System.out.println("\nI dati sono stati salvati nel file " + fileName);
        } catch (IOException e) {
            System.out.println("Si è verificato un errore durante il salvataggio dei dati: " + e.getMessage());
        }
    }
}
