
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Random;

public class GiocoImpiccato {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            File file = new File("C:\\Users\\STUDENTE\\Desktop\\ITS-Steve-Jobs\\SteveJobs\\JAVA2\\resources\\words.txt");
            Scanner fileScanner = new Scanner(file);
            String[] parole = fileScanner.nextLine().split("-");
            Random random = new Random();
            int index = random.nextInt(parole.length);
           
            fileScanner.close();
            String parola = parole[index];
            char[] parolaArray = parola.toCharArray();
            char[] parolaNascosta = new char[parolaArray.length];
            ArrayList<Character> lettereIns = new ArrayList<Character>();

            for (int i = 0; i < parolaNascosta.length; i++) {
                parolaNascosta[i] = '_';
            }

            int Tentativi = 6;

            while (Tentativi > 0) {
                System.out.println("Parola: ");
                for (int i = 0; i < parolaNascosta.length; i++) {
                    System.out.print(parolaNascosta[i] + " ");
                }
                System.out.println("\nTentativi rimasti: " + Tentativi);
                System.out.println("Inserisci una lettera: ");
                char lettera = scanner.next().charAt(0);
                
                if (lettereIns.contains(lettera)) {
                    System.out.println("Hai già inserito questa lettera");
                    continue;
                } else if (parola.contains(String.valueOf(lettera))) {
                    for (int i = 0; i < parolaArray.length; i++) {
                        if (parolaArray[i] == lettera) {
                            parolaNascosta[i] = lettera;
                        }
                    }
                    lettereIns.add(lettera);
                } else {
                    Tentativi--;
                    lettereIns.add(lettera);
                    System.out.println("Lettera errata!");
                }

                if (parola.equals(String.valueOf(parolaNascosta))) {
                    System.out.println("Hai vinto! La parola era: " + parola);
                    break;
                } else if (Tentativi == 0) {
                    System.out.println("Hai perso! La parola era: " + parola);
                    break;
                }
            }

            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("Errore: " + e.getMessage());
        }
}
}


// Gioco Impiccato Del Professore
// Come l'ha impostato: ha creato dei file diversi , per logica , grafica e gestione del gioco
// File per le parole randomiche
