import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.HashSet;

public class HangmanGameSwing {

    private static final int MAX_ERRORS = 5;
    private static String secretWord = "bambola"; // Parola segreta
    private static HashSet<Character> guessedLetters = new HashSet<>();
    private static HashSet<Character> wrongLetters = new HashSet<>();
    private static int errors = 0;

    private static JLabel wordLabel;
    private static JLabel wrongLettersLabel;
    private static JLabel errorsLabel;
    private static JTextField inputField;
    private static JButton guessButton;

    public static void main(String[] args) {
        // Creazione della finestra principale
        JFrame frame = new JFrame("Gioco dell'Impiccato");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 300);
        frame.setLayout(new BorderLayout());

        // Pannello superiore per la parola
        JPanel topPanel = new JPanel();
        wordLabel = new JLabel();
        topPanel.add(wordLabel);

        // Pannello centrale per le lettere sbagliate
        JPanel centerPanel = new JPanel();
        wrongLettersLabel = new JLabel("Lettere errate: ");
        centerPanel.add(wrongLettersLabel);

        // Pannello inferiore per il tentativo
        JPanel bottomPanel = new JPanel();
        inputField = new JTextField(1);
        guessButton = new JButton("Indovina");

        // Aggiunta di listener al pulsante
        guessButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                handleGuess();
            }
        });

        bottomPanel.add(new JLabel("Inserisci una lettera: "));
        bottomPanel.add(inputField);
        bottomPanel.add(guessButton);

        // Pannello per gli errori rimanenti
        JPanel errorPanel = new JPanel();
        errorsLabel = new JLabel("Tentativi rimasti: " + (MAX_ERRORS - errors));
        errorPanel.add(errorsLabel);

        // Aggiunta dei pannelli alla finestra
        frame.add(topPanel, BorderLayout.NORTH);
        frame.add(centerPanel, BorderLayout.CENTER);
        frame.add(bottomPanel, BorderLayout.SOUTH);
        frame.add(errorPanel, BorderLayout.WEST);

        // Mostra la finestra
        frame.setVisible(true);

        // Avvio del gioco
        updateGame();
    }

    private static void handleGuess() {
        String input = inputField.getText().toLowerCase();
        inputField.setText(""); // Pulisce il campo di input

        // Se l'input è valido (una singola lettera)
        if (input.length() == 1 && input.matches("[a-z]")) {
            char guess = input.charAt(0);

            // Se la lettera è già stata tentata
            if (guessedLetters.contains(guess) || wrongLetters.contains(guess)) {
                JOptionPane.showMessageDialog(null, "Hai già provato questa lettera.");
                return;
            }

            // Controlla se la lettera è corretta
            if (secretWord.indexOf(guess) >= 0) {
                guessedLetters.add(guess);
                JOptionPane.showMessageDialog(null, "Lettera corretta!");
            } else {
                wrongLetters.add(guess);
                errors++;
                JOptionPane.showMessageDialog(null, "Lettera errata. Hai " + (MAX_ERRORS - errors) + " tentativi rimasti.");
            }

            updateGame();

            // Se il giocatore ha vinto
            if (hasGuessedAllLetters()) {
                JOptionPane.showMessageDialog(null, "Congratulazioni! Hai indovinato la parola segreta: " + secretWord);
                resetGame();
            }

            // Se il giocatore ha raggiunto il numero massimo di errori
            if (errors >= MAX_ERRORS) {
                JOptionPane.showMessageDialog(null, "Hai perso! La parola segreta era: " + secretWord);
                resetGame();
            }
        } else {
            JOptionPane.showMessageDialog(null, "Inserisci una lettera valida.");
        }
    }

    private static void updateGame() {
        // Mostra la parola attuale con le lettere indovinate
        StringBuilder displayWord = new StringBuilder();
        for (char letter : secretWord.toCharArray()) {
            if (guessedLetters.contains(letter)) {
                displayWord.append(letter).append(" ");
            } else {
                displayWord.append("_ ");
            }
        }
        wordLabel.setText(displayWord.toString());

        // Mostra le lettere errate
        wrongLettersLabel.setText("Lettere errate: " + String.join(", ", wrongLetters.toString()));

        // Aggiorna i tentativi rimanenti
        errorsLabel.setText("Tentativi rimasti: " + (MAX_ERRORS - errors));
    }

    private static boolean hasGuessedAllLetters() {
        for (char letter : secretWord.toCharArray()) {
            if (!guessedLetters.contains(letter)) {
                return false;
            }
        }
        return true;
    }

    private static void resetGame() {
        // Resetta il gioco
        guessedLetters.clear();
        wrongLetters.clear();
        errors = 0;
        updateGame();
    }
}
