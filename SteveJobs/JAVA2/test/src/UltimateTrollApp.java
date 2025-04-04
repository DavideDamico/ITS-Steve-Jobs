import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Random;

public class UltimateTrollApp {

    private static JFrame frame;
    private static JButton trollButton;
    private static JLabel messageLabel;
    private static Random random;

    public static void main(String[] args) {
        // Crea il frame principale
        frame = new JFrame("Troll Yourself!");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(500, 300);
        frame.setLayout(new BorderLayout());

        // Crea un'etichetta per i messaggi
        messageLabel = new JLabel("Clicca il pulsante per iniziare il tuo viaggio nel caos!", JLabel.CENTER);
        messageLabel.setFont(new Font("Arial", Font.BOLD, 18));
        messageLabel.setForeground(Color.BLACK);
        frame.add(messageLabel, BorderLayout.CENTER);

        // Crea il pulsante che avvia la "trollata"
        trollButton = new JButton("Inizia lo scherzo!");
        trollButton.setFont(new Font("Comic Sans MS", Font.PLAIN, 20));
        trollButton.setBackground(new Color(255, 99, 71)); // Colore simpatico di "trollaggio"
        frame.add(trollButton, BorderLayout.SOUTH);

        // Rende il frame visibile
        frame.setVisible(true);

        // Crea un generatore di numeri casuali per variare gli scherzi
        random = new Random();

        // ActionListener per il pulsante
        trollButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                performRandomTroll();
            }
        });
    }

    // Metodo che esegue scherzi casuali
    private static void performRandomTroll() {
        int trollType = random.nextInt(5);

        switch (trollType) {
            case 0:
                randomPopup();
                break;
            case 1:
                languageSwitch();
                break;
            case 2:
                systemErrorTroll();
                break;
            case 3:
                randomButtonMovements();
                break;
            case 4:
                funnyMessage();
                break;
            default:
                break;
        }
    }

    // Scherzo: Finestra popup che appare a caso
    private static void randomPopup() {
        JFrame popup = new JFrame("Pop-up di confusione!");
        popup.setSize(300, 150);
        popup.setLocation(random.nextInt(800), random.nextInt(600));
        popup.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        popup.add(new JLabel("Ooooops! Non toccare niente!!", JLabel.CENTER), BorderLayout.CENTER);
        popup.setVisible(true);
        messageLabel.setText("Popup a caso, lo hai visto?");
    }

    // Scherzo: Cambia la lingua della finestra a una lingua random
    private static void languageSwitch() {
        String[] languages = {"fr", "de", "es", "it", "ja"};
        String selectedLanguage = languages[random.nextInt(languages.length)];

        // Cambia la lingua della GUI a caso (solo il testo)
        if (selectedLanguage.equals("fr")) {
            messageLabel.setText("Cliquez sur le bouton pour commencer votre voyage dans le chaos!");
        } else if (selectedLanguage.equals("de")) {
            messageLabel.setText("Klicken Sie auf die Schaltfläche, um Ihre Reise im Chaos zu beginnen!");
        } else if (selectedLanguage.equals("es")) {
            messageLabel.setText("¡Haz clic en el botón para comenzar tu viaje en el caos!");
        } else if (selectedLanguage.equals("it")) {
            messageLabel.setText("Clicca sul pulsante per iniziare il tuo viaggio nel caos!");
        } else if (selectedLanguage.equals("ja")) {
            messageLabel.setText("ボタンをクリックしてカオスの旅を開始します！");
        }

        messageLabel.setForeground(Color.RED);
    }

    // Scherzo: Errori di sistema fake
    private static void systemErrorTroll() {
        JOptionPane.showMessageDialog(frame, "Errore di sistema! Crash imminente!", "Errore", JOptionPane.ERROR_MESSAGE);
        messageLabel.setText("ERRORE DI SISTEMA!!!");
        messageLabel.setForeground(Color.RED);
        // Potrebbe sembrare un errore ma non succede nulla davvero... 😏
    }

    // Scherzo: Sposta il pulsante in una posizione random
    private static void randomButtonMovements() {
        int x = random.nextInt(300);
        int y = random.nextInt(200);
        trollButton.setLocation(x, y);
        trollButton.setText("Mi hai trovato?");
        messageLabel.setText("Muovi il mouse velocemente!");
    }

    // Scherzo: Messaggio divertente che cambia continuamente
    private static void funnyMessage() {
        String[] messages = {
            "Sei un campione! 😎",
            "Mai visto un troll come te! 😂",
            "Non smettere mai di cliccare!",
            "Ahhh, ti sei trollato di nuovo!",
            "Fai attenzione, il mondo sta per esplodere!"
        };
        messageLabel.setText(messages[random.nextInt(messages.length)]);
        messageLabel.setForeground(new Color(random.nextInt(256), random.nextInt(256), random.nextInt(256))); // Cambia il colore casualmente
    }
}
