package GiocoImpiccatoProfVersion.src.game;

import java.util.*;
import java.io.*;
import java.nio.file.*;

class HangmanLogic {
    private String wordToGuess;
    private char[] currentGuess;
    private int attemptsLeft = 0;
    private Set<Character> guessedLetters = new HashSet<>();
    
    public HangmanLogic() {
        this.wordToGuess = chooseRandomWord();
        this.currentGuess = new char[wordToGuess.length()];
        Arrays.fill(currentGuess, '_');
    }

    public void SceltaDifficolta(int difficolta) {
        switch (difficolta) {
            case 1:
                attemptsLeft = 12;
                break;
            case 2:
                attemptsLeft = 6;
                break;
            case 3:
                attemptsLeft = 3;
                break;
            default:
                attemptsLeft = 6;
                break;
        }
        
    }

    private String chooseRandomWord() {
        List<String> words;
        try {
            words = Files.readAllLines(Paths.get("C:\\Users\\STUDENTE\\Desktop\\ITS-Steve-Jobs\\SteveJobs\\JAVA2\\test\\src\\GiocoImpiccatoProfVersion\\resources\\words.txt"));
            Random rand = new Random();
            return words.get(rand.nextInt(words.size())).toLowerCase().trim();
        } catch (IOException e) {
            e.printStackTrace();
            return "errore";
        }
    }

    public boolean guessLetter(char letter) {
        letter = Character.toLowerCase(letter);
        if (guessedLetters.contains(letter)) {
            return false;
        }

        guessedLetters.add(letter);
        boolean found = false;

        for (int i = 0; i < wordToGuess.length(); i++) {
            if (wordToGuess.charAt(i) == letter) {
                currentGuess[i] = letter;
                found = true;
            }
        }

        if (!found) {
            attemptsLeft--;
        }
        return found;
    }

    public String getCurrentGuess() {
        return String.valueOf(currentGuess);
    }

    public int getAttemptsLeft() {
        return attemptsLeft;
    }

    public boolean isWon() {
        return wordToGuess.equals(getCurrentGuess());
    }

    public boolean isLost() {
        return attemptsLeft <= 0;
    }

    public String getWordToGuess() {
        return wordToGuess;
    }

    public Set<Character> getGuessedLetters() {
        return guessedLetters;
    }
}
