import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;

public class FlipperGame extends JPanel implements ActionListener, KeyListener {

    private int ballX, ballY, ballSpeedX, ballSpeedY;
    private final int ballDiameter = 20;
    private int flipperX, flipperY;
    private final int flipperWidth = 100;
    private final int flipperHeight = 10;
    private Timer timer;
    private final int flipperSpeed = 20; // velocità di movimento del flipper

    private int score = 0; // Punteggio
    private boolean gameOver = false;

    // Lista per gestire i blocchi e i loro punteggi
    private ArrayList<Block> blocks = new ArrayList<>();

    // Variabili per la velocità massima della palla
    private int speedBoostCount = 0;  // Conta quante volte la velocità è aumentata
    private final int maxSpeedBoosts = 4; // Numero massimo di aumenti della velocità
    private final int maxSpeed = 10; // Velocità massima consentita

    public FlipperGame() {
        // Impostazioni della palla
        this.ballX = 300;
        this.ballY = 500;
        this.ballSpeedX = 2;
        this.ballSpeedY = -3;

        // Impostazioni del flipper
        this.flipperX = 250;
        this.flipperY = 550;

        // Crea i blocchi (posizione, dimensione e punteggio)
        createBlocks();

        // Timer per aggiornare la posizione ogni 10 ms
        timer = new Timer(10, this);
        timer.start();

        // Aggiungi KeyListener per i tasti di movimento
        addKeyListener(this);
        setFocusable(true);
    }

    // Classe per i blocchi, ognuno con una dimensione e un punteggio
    private class Block {
        Rectangle rect;
        int points;

        Block(int x, int y, int width, int height, int points) {
            this.rect = new Rectangle(x, y, width, height);
            this.points = points;
        }
    }

    // Metodo per creare i blocchi
    private void createBlocks() {
        int blockWidth = 60;
        int blockHeight = 20;
        int rows = 3;
        int cols = 10;

        // Crea blocchi con punteggio variabile
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                int points = (i + 1) * 10;  // Punteggio in base alla riga
                blocks.add(new Block(j * (blockWidth + 10) + 50, i * (blockHeight + 5) + 30, blockWidth, blockHeight, points));
            }
        }
    }

    // Disegna gli elementi (palla, flipper, blocchi, Game Over)
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        // Sfondo del gioco
        g.setColor(Color.BLACK);
        g.fillRect(0, 0, getWidth(), getHeight());

        // Disegna il punteggio
        g.setColor(Color.WHITE);
        g.setFont(new Font("Arial", Font.BOLD, 20));
        g.drawString("Punteggio: " + score, 10, 30);

        // Disegna la palla
        g.setColor(Color.WHITE);
        g.fillOval(ballX, ballY, ballDiameter, ballDiameter);

        // Disegna il flipper
        g.setColor(Color.RED);
        g.fillRect(flipperX, flipperY, flipperWidth, flipperHeight);

        // Disegna i blocchi con la grafica in base al punteggio
        for (Block block : blocks) {
            if (block.points == 10) {
                g.setColor(Color.BLUE); // Colore per i blocchi da 10 punti
            } else if (block.points == 20) {
                g.setColor(Color.GREEN); // Colore per i blocchi da 20 punti
            } else if (block.points == 30) {
                g.setColor(Color.YELLOW); // Colore per i blocchi da 30 punti
            }
            g.fillRect(block.rect.x, block.rect.y, block.rect.width, block.rect.height);

            // Disegna il punteggio sopra ogni blocco
            g.setColor(Color.WHITE);
            g.drawString(String.valueOf(block.points), block.rect.x + block.rect.width / 2 - 10, block.rect.y + block.rect.height / 2 + 5);
        }

        // Se il gioco è finito, mostra il messaggio "Hai Vinto!" o "Game Over"
        if (gameOver) {
            if (blocks.isEmpty()) {
                // Se tutti i blocchi sono distrutti, mostra "Hai Vinto!"
                g.setColor(Color.GREEN);
                g.setFont(new Font("Arial", Font.BOLD, 50));
                g.drawString("HAI VINTO!", getWidth() / 2 - 150, getHeight() / 2 - 50);
                
                // Crea i pulsanti "Avanza" ed "Esci"
                JButton advanceButton = new JButton("Avanza");
                advanceButton.setBounds(getWidth() / 2 - 100, getHeight() / 2 + 10, 200, 50);
                advanceButton.addActionListener(e -> advanceLevel());
                add(advanceButton);

                JButton exitButton = new JButton("Esci");
                exitButton.setBounds(getWidth() / 2 - 100, getHeight() / 2 + 70, 200, 50);
                exitButton.addActionListener(e -> System.exit(0));
                add(exitButton);
            } else {
                // Se il gioco è finito senza aver vinto
                g.setColor(Color.RED);
                g.setFont(new Font("Arial", Font.BOLD, 50));
                g.drawString("GAME OVER", getWidth() / 2 - 150, getHeight() / 2 - 50);

                // Crea i pulsanti "Rigioca" ed "Esci"
                JButton replayButton = new JButton("Rigioca");
                replayButton.setBounds(getWidth() / 2 - 100, getHeight() / 2 + 10, 200, 50);
                replayButton.addActionListener(e -> restartGame());
                add(replayButton);

                JButton exitButton = new JButton("Esci");
                exitButton.setBounds(getWidth() / 2 - 100, getHeight() / 2 + 70, 200, 50);
                exitButton.addActionListener(e -> System.exit(0));
                add(exitButton);
            }

            // Disabilita il timer quando il gioco è finito
            timer.stop();
        }
    }

    // Azioni da eseguire durante il timer
    @Override
    public void actionPerformed(ActionEvent e) {
        if (!gameOver) {
            // Aggiorna la posizione della palla
            ballX += ballSpeedX;
            ballY += ballSpeedY;

            // Collisione con i bordi orizzontali (sinistra e destra)
            if (ballX <= 0 || ballX >= getWidth() - ballDiameter) {
                ballSpeedX = -ballSpeedX;
            }

            // Collisione con il bordo superiore (palla rimbalza verso il basso)
            if (ballY <= 0) {
                ballSpeedY = -ballSpeedY;
            }

            // Collisione con il flipper
            if (ballY + ballDiameter >= flipperY && ballY + ballDiameter <= flipperY + flipperHeight) {
                if (ballX + ballDiameter >= flipperX && ballX <= flipperX + flipperWidth) {
                    ballSpeedY = -ballSpeedY; // Rimbalzo della palla
                }
            }

            // Collisione con i blocchi
            for (int i = 0; i < blocks.size(); i++) {
                Block block = blocks.get(i);
                if (ballX + ballDiameter >= block.rect.x && ballX <= block.rect.x + block.rect.width &&
                    ballY + ballDiameter >= block.rect.y && ballY <= block.rect.y + block.rect.height) {
                    blocks.remove(i); // Rimuovi il blocco
                    ballSpeedY = -ballSpeedY; // Rimbalzo della palla
                    score += block.points; // Aggiungi il punteggio del blocco

                    // Aumenta la velocità ma solo se non ha raggiunto il limite
                    if (speedBoostCount < maxSpeedBoosts) {
                        ballSpeedX += (ballSpeedX > 0 ? 1 : -1);
                        ballSpeedY += (ballSpeedY > 0 ? 1 : -1);

                        // Limita la velocità massima
                        if (Math.abs(ballSpeedX) > maxSpeed) ballSpeedX = maxSpeed * (ballSpeedX > 0 ? 1 : -1);
                        if (Math.abs(ballSpeedY) > maxSpeed) ballSpeedY = maxSpeed * (ballSpeedY > 0 ? 1 : -1);

                        speedBoostCount++; // Incrementa il contatore dei boost
                    }

                    break; // Esci dal ciclo per evitare problemi durante la modifica della lista
                }
            }

            // Verifica se la palla è caduta sotto il flipper (Game Over)
            if (ballY >= getHeight()) {
                gameOver = true;
                repaint();
            }

            // Verifica se tutti i blocchi sono distrutti (vittoria)
            if (blocks.isEmpty()) {
                gameOver = true;
                repaint();
            }

            // Aggiorna la posizione dei flipper per il prossimo ciclo
            repaint();
        }
    }

    // Gestisce i tasti premuti per muovere il flipper
    @Override
    public void keyPressed(KeyEvent e) {
        if (e.getKeyCode() == KeyEvent.VK_LEFT) {
            if (flipperX > 0) {
                flipperX -= flipperSpeed; // Muove il flipper verso sinistra
            }
        }
        if (e.getKeyCode() == KeyEvent.VK_RIGHT) {
            if (flipperX < getWidth() - flipperWidth) {
                flipperX += flipperSpeed; // Muove il flipper verso destra
            }
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {}

    @Override
    public void keyTyped(KeyEvent e) {}

    // Metodo per rigiocare (riavviare il gioco)
    private void restartGame() {
        // Rimuove i pulsanti prima di riavviare il gioco
        removeAll(); // Rimuove tutto dalla finestra, inclusi i pulsanti

        ballX = 300;
        ballY = 500;
        ballSpeedX = 2;
        ballSpeedY = -3;
        flipperX = 250;
        score = 0;
        speedBoostCount = 0; // Reset del contatore di velocità
        blocks.clear();
        createBlocks();
        gameOver = false;
        timer.start();
        addKeyListener(this); // Riaggiungi il KeyListener
        setFocusable(true); // Assicurati che il pannello sia focusabile
        repaint();
    }

    // Metodo per avanzare al livello successivo
    private void advanceLevel() {
        // Rimuovi i pulsanti prima di avanzare
        removeAll(); // Rimuove tutto dalla finestra, inclusi i pulsanti

        // Aumenta la difficoltà (aggiungi più blocchi e rendi i blocchi più difficili)
        score = 0;
        speedBoostCount = 0;
        blocks.clear();
        createBlocks();  // Rimuove e crea nuovi blocchi (puoi modificarlo per cambiare la configurazione)
        gameOver = false;

        timer.start();
        addKeyListener(this); // Riaggiungi il KeyListener
        setFocusable(true); // Assicurati che il pannello sia focusabile
        repaint();
    }

    // Crea la finestra del gioco
    public static void main(String[] args) {
        JFrame frame = new JFrame("Flipper Animato");
        FlipperGame gamePanel = new FlipperGame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);
        frame.add(gamePanel);
        frame.setVisible(true);
    }
}
