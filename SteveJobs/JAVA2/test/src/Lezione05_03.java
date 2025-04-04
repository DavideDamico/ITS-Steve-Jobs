// public class Lezione05_03 {

//     public class Persona {
//         // Attributi della classe (stato)
//         String nome;
//         int eta;

//         // Metodo costruttore
//         Persona(String nome, int eta) {
//             this.nome = nome;
//             this.eta = eta;
//         }

//         // Metodo per visualizzare le informazioni
//         void mostraDettagli() {
//             System.out.println("Nome: " + nome + ", Età: " + eta);
//         }
//     }
//     public static void main(String[] args) {

//         Lezione05_03 obj = new Lezione05_03();

//         // Creazione di un oggetto della classe Persona
//         Persona p1 = obj.new Persona("Mario", 30);
//         Persona p2 = obj.new Persona("Luigi", 25);

//         // Visualizzazione delle informazioni
//         System.out.println("Informazioni della persona prima della modifica:");
//         p1.mostraDettagli();
//         p2.mostraDettagli();

//         System.out.println();

//         // Modifica dell'oggetto tramite riferimento
//         Persona p3 = p1;
//         p3.nome = "Giovanni";

//         System.out.println("Informazioni dopo la modifica:");
//         p3.mostraDettagli();
//         p2.mostraDettagli();

//     }
// }

// Definizione della classe Persona - Variante del professore
// class Persona {

//     // Attributi della classe (variabili di istanza)
//     String nome;
//     int eta;

//     // Costruttore per inizializzare l'oggetto
//     Persona(String nome, int eta) {
//         this.nome = nome;
//         this.eta = eta;
//     }

//     // Metodo per visualizzare i dettagli della persona
//     void mostraDettagli() {
//         System.out.println("Nome: " + nome + ", Età: " + eta);
//     }
// }

// // Classe principale con il metodo main
// public class Lezione05_03 {
//     public static void main(String[] args) {
//         // Creazione di oggetti della classe Persona
//         Persona persona1 = new Persona("Mario", 30);
//         Persona persona2 = new Persona("Anna", 25);

//         // Stampa delle informazioni delle persone
//         System.out.println("Informazioni prima della modifica:");
//         persona1.mostraDettagli();
//         persona2.mostraDettagli();

//         // Creazione di un nuovo riferimento alla stessa istanza di persona1
//         Persona persona3 = persona1;

//         // Modifica dell'oggetto tramite il nuovo riferimento
//         persona3.nome = "Giovanni";
            
//         // Stampa delle informazioni dopo la modifica
//         System.out.println("\nInformazioni dopo la modifica:");
//         persona1.mostraDettagli(); // Cambiato perché persona1 e persona3 puntano allo stesso oggetto
//         persona2.mostraDettagli(); // Rimasto invariato
//     }
// }

// ------------ ESERCIZIO ------------

// import java.util.Scanner;

// class Persona {
//     String nome;
//     int eta;

//     Persona(String nome, int eta) {
//         this.nome = nome;
//         this.eta = eta;
//     }

//     void mostraDettagli() {
//         System.out.println("Nome: " + nome + ", Età: " + eta);
//     }
// }

// public class Lezione05_03 {
//     public static void main(String[] args) {
//         Scanner scanner = new Scanner(System.in);

//         System.out.println("Quante persone vuoi inserire?");
//         int numeroPersone = scanner.nextInt();
//         scanner.nextLine();

//         Persona[] elencoPersone = new Persona[numeroPersone];

//         for (int i = 0; i < numeroPersone; i++) {
//             System.out.println("Inserisci il nome della " + (i + 1) + "° persona");
//             System.out.print("Nome: ");
//             String nome = scanner.nextLine();

//             System.out.println("Inserisci l'età della " + (i + 1) + "° persona");
//             System.out.print("Età: ");
//             int eta = scanner.nextInt();
//             scanner.nextLine();

//             elencoPersone[i] = new Persona(nome, eta);
//         }

//         System.out.println("\nElenco delle persone inserite:");
//         for (Persona p : elencoPersone) {
//             p.mostraDettagli();
//         }

//         scanner.close();
//     }
// }

// FormExample 

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Lezione05_03 {
    public static void main(String[] args) {

        // Creazione della finestra
        JFrame frame = new JFrame("Modulo di Registrazione");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(550, 450);
        frame.setLayout(new GridLayout(4, 2, 5, 5));

        // Creazione dei componenti del form
        JLabel lblNome = new JLabel("Nome:");
        JTextField txtNome = new JTextField();
        JLabel lblCognome = new JLabel("Cognome:");
        JTextField txtCognome = new JTextField();
        JLabel lblEmail = new JLabel("Email:");
        JTextField txtEmail = new JTextField();
        JButton btnInvia = new JButton("Invia");
        JLabel lblRisultato = new JLabel("");

        // Aggiunta dell'azione al pulsante
        btnInvia.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String nome = txtNome.getText();
                String cognome = txtCognome.getText();
                String email = txtEmail.getText();
                lblRisultato.setText("Dati inviati: " + nome + " " + cognome + ", " + email);
                }
        });

        // Aggiunta dei componenti alla finestra
        frame.add(lblNome);
        frame.add(txtNome);
        frame.add(lblCognome);
        frame.add(txtCognome);
        frame.add(lblEmail);
        frame.add(txtEmail);
        frame.add(btnInvia);
        frame.add(lblRisultato);

        // Visualizzazione della finestra
        frame.setVisible(true);
    }
}