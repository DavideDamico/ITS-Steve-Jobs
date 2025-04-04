package GiocoImpiccatoProfVersion.src.game;

import javax.swing.*;
import java.awt.*;

public class HangmanGUI extends JFrame {
    private HangmanLogic game;
    private JLabel wordLabel, attemptsLabel, messageLabel;
    private JTextField inputField;
    private JButton guessButton;

    public HangmanGUI() {
        game = new HangmanLogic();
        setTitle("Gioco dell'Impiccato");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(600, 400);
        setLayout(new BorderLayout());
        // --- Pannello superiore: parola nascosta ---
        wordLabel = new JLabel(game.getCurrentGuess(), SwingConstants.CENTER);
        wordLabel.setFont(new Font("Monospaced", Font.BOLD, 30));
        add(wordLabel, BorderLayout.NORTH);
        SceltaDifficolta();
        // --- Pannello centrale con tentativi rimasti ---
        attemptsLabel = new JLabel("Tentativi rimasti: " + game.getAttemptsLeft(),
        SwingConstants.CENTER);
        add(attemptsLabel, BorderLayout.CENTER);
        // --- Pannello inferiore con campo input + bottone ---
        inputField = new JTextField(2);
        inputField.setFont(new Font("SansSerif", Font.PLAIN, 20));
        inputField.setPreferredSize(new Dimension(50, 30));
        guessButton = new JButton("Prova");
        guessButton.setFont(new Font("SansSerif", Font.PLAIN, 16));
        JPanel inputPanel = new JPanel(new FlowLayout());
        inputPanel.add(new JLabel("Lettera: "));
        inputPanel.add(inputField);
        inputPanel.add(guessButton);
        JPanel bottomPanel = new JPanel(new BorderLayout());
        messageLabel = new JLabel("Inserisci una lettera:", SwingConstants.CENTER);
        bottomPanel.add(messageLabel, BorderLayout.NORTH);
        bottomPanel.add(inputPanel, BorderLayout.SOUTH);
        add(bottomPanel, BorderLayout.SOUTH);
        // --- Eventi ---
        guessButton.addActionListener(e -> makeGuess());
        inputField.addActionListener(e -> makeGuess());
        setVisible(true);
    }

    public void SceltaDifficolta() {
        int difficolta = JOptionPane.showOptionDialog(null, "Scegli la difficoltà", "Difficoltà",
                JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null,
                new String[] { "Facile", "Medio", "Difficile" }, "Facile");
        switch (difficolta) {
            case 0:
                game.SceltaDifficolta(1);
                break;
            case 1:
                game.SceltaDifficolta(2);
                break;
            case 2:
                game.SceltaDifficolta(3);
                break;
            default:
                game.SceltaDifficolta(2);
                break;
        }
    }

    private void makeGuess() {
        String input = inputField.getText().toLowerCase();
        inputField.setText("");
        if (input.length() != 1 || !Character.isLetter(input.charAt(0))) {
            messageLabel.setText("Inserisci UNA lettera valida!");
            return;
        }
        char letter = input.charAt(0);
        boolean found = game.guessLetter(letter);
        wordLabel.setText(game.getCurrentGuess());
        attemptsLabel.setText("Tentativi rimasti: " + game.getAttemptsLeft());

        if (game.isWon()) {
            messageLabel.setText("Hai vinto! La parola era: " + game.getWordToGuess());
            disableInput();
        } else if (game.isLost()) {
            messageLabel.setText("Hai perso! La parola era: " + game.getWordToGuess());
            wordLabel.setText(game.getWordToGuess());
            disableInput();
        } else {
            messageLabel.setText(found ? "Lettera corretta!" : "Lettera sbagliata!");
        }
    }

    private void disableInput() {
        inputField.setEnabled(false);
        guessButton.setEnabled(false);
    }
}