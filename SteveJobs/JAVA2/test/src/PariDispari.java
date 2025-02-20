import java.util.Scanner;

public class PariDispari {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Inserisci un numero: ");
        int numero = scanner.nextInt();
        
        if (numero % 2 == 0) {
        System.out.println(numero + " è pari.");
        } else {
        System.out.println(numero + " è dispari.");
        }
        scanner.close();
    }
}