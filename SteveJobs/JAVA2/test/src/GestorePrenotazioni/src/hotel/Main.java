package hotel;

import java.util.Scanner;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Hotel hotel = Hotel.caricaStato("hotel.dat");
        if (hotel == null) {
            hotel = new Hotel();
        }

        Scanner scanner = new Scanner(System.in);
        int scelta;
        do {
            System.out.println("Benvenuto nel sistema di gestione delle prenotazioni dell'hotel IL GIRASOLE!");
            System.out.println("Scegli un'opzione:");
            System.out.println("1. Aggiungi una nuova camera");
            System.out.println("2. Visualizza le camere disponibili");
            System.out.println("3. Prenota una camera");
            System.out.println("4. Visualizza tutte le prenotazioni");
            System.out.println("5. Calcola l'incasso totale dell'hotel");
            System.out.println("6. Cerca prenotazione per cliente");
            System.out.println("7. Salva ed Esci");
            scelta = scanner.nextInt();

            switch (scelta) {
                case 1:
                    int numeroCamera = 0;
                    while (true) {
                        System.out.println("Numero della camera: ");
                        if (scanner.hasNextInt()) {
                            numeroCamera = scanner.nextInt();
                            if (numeroCamera > 0) break;
                            else System.out.println("Il numero della camera deve essere un numero positivo.");
                        } else {
                            System.out.println("Input non valido. Inserisci un numero intero positivo.");
                            scanner.next(); 
                        }
                    }

                    String tipoCamera = "";
                    while (true) {
                        System.out.println("Tipo di camera (singola, doppia, suite): ");
                        tipoCamera = scanner.next();
                        if (tipoCamera.equalsIgnoreCase("singola") || tipoCamera.equalsIgnoreCase("doppia") || tipoCamera.equalsIgnoreCase("suite")) {
                            break;
                        } else {
                            System.out.println("Tipo di camera non valido. Scegli tra 'singola', 'doppia' o 'suite'.");
                        }
                    }

                    double prezzoPerNotte = 0;
                    while (true) {
                        System.out.println("Prezzo per notte: ");
                        if (scanner.hasNextDouble()) {
                            prezzoPerNotte = scanner.nextDouble();
                            if (prezzoPerNotte > 0) break;
                            else System.out.println("Il prezzo per notte deve essere un numero positivo.");
                        } else {
                            System.out.println("Input non valido. Inserisci un numero valido.");
                            scanner.next(); 
                        }
                    }

                    Camera camera = new Camera(numeroCamera, tipoCamera, prezzoPerNotte);
                    hotel.aggiungiCamera(camera);
                    System.out.println("Camera aggiunta con successo!");
                    break;

                case 2:
                    System.out.println("Camere disponibili: ");
                    List<Camera> camereDisponibili = hotel.getCamereDisponibili();
                    if (camereDisponibili.isEmpty()) {
                        System.out.println("Nessuna camera disponibile.");
                    } else {
                        for (Camera c : camereDisponibili) {
                            System.out.println(c.toString());
                        }
                    }
                    break;

                case 3:
                    String nome = "";
                    while (true) {
                        System.out.println("Nome: ");
                        nome = scanner.next();
                        if (nome.matches("[a-zA-Z]+")) {
                            break;
                        } else {
                            System.out.println("Il nome non può contenere numeri.");
                        }
                    }

                    String cognome = "";
                    while (true) {
                        System.out.println("Cognome: ");
                        cognome = scanner.next();
                        if (cognome.matches("[a-zA-Z]+")) {
                            break;
                        } else {
                            System.out.println("Il cognome non può contenere numeri.");
                        }
                    }

                    String email = "";
                    while (true) {
                        System.out.println("Email: ");
                        email = scanner.next();
                        if (email.contains("@")) {
                            break;
                        } else {
                            System.out.println("L'email deve contenere '@'.");
                        }
                    }

                    int numeroNotti = 0;
                    while (true) {
                        System.out.println("Numero di notti : ");
                        if (scanner.hasNextInt()) {
                            numeroNotti = scanner.nextInt();
                            if (numeroNotti > 0) break;
                            else System.out.println("Il numero di notti deve essere positivo.");
                        } else {
                            System.out.println("Input non valido. Inserisci un numero valido.");
                            scanner.next(); 
                        }
                    }

                    List<Camera> camereLibere = hotel.getCamereDisponibili();
                    if (camereLibere.isEmpty()) {
                        System.out.println("Nessuna camera disponibile per la prenotazione.");
                    } else {
                        System.out.println("Scegli una camera tra le seguenti:");
                        for (int i = 0; i < camereLibere.size(); i++) {
                            System.out.println((i + 1) + ". " + camereLibere.get(i).toString());
                        }
                        int sceltaCamera = scanner.nextInt() - 1;
                        if (sceltaCamera >= 0 && sceltaCamera < camereLibere.size()) {
                            Camera cameraPrenotata = camereLibere.get(sceltaCamera);
                            Cliente cliente = new Cliente(nome, cognome, email);
                            Prenotazione prenotazione = new Prenotazione(cliente, cameraPrenotata, numeroNotti);
                            hotel.nuovaPrenotazione(prenotazione);
                            cameraPrenotata.setOccupata(true);
                            cameraPrenotata.setCliente(cliente);
                            System.out.println("Prenotazione effettuata con successo!");
                        } else {
                            System.out.println("Scelta non valida.");
                        }
                    }
                    break;

                case 4:
                    System.out.println("Prenotazioni effettuate: ");
                    hotel.mostraPrenotazioni();
                    break;

                case 5:
                    System.out.println("Incasso totale dell'hotel: " + hotel.incassoTotale() + " euro.");
                    break;

                case 6:
                    String emailCercata = "";
                    while (true) {
                        System.out.println("Inserisci l'email del cliente da cercare: ");
                        emailCercata = scanner.next();
                        if (emailCercata.contains("@")) {
                            break;
                        } else {
                            System.out.println("L'email deve contenere '@'.");
                        }
                    }
                    List<Prenotazione> prenotazioniTrovate = hotel.cercaPrenotazionePerCliente(emailCercata);
                    if (prenotazioniTrovate.isEmpty()) {
                        System.out.println("Nessuna prenotazione trovata per l'email: " + emailCercata);
                    } else {
                        System.out.println("Prenotazioni trovate: ");
                        for (int i = 0; i < prenotazioniTrovate.size(); i++) {
                            System.out.println((i + 1) + ". " + prenotazioniTrovate.get(i).toString());
                        }
                    }
                    break;

                case 7:
                    hotel.salvaStato("hotel.dat");
                    System.out.println("Uscita dal programma.");
                    break;

                default:
                    System.out.println("Scelta non valida. Riprova.");
            }
        } while (scelta != 7);
        
        scanner.close();
    }
}
