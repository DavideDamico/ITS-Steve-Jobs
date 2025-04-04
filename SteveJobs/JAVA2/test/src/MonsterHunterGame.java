import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Random;

public class MonsterHunterGame extends JPanel implements ActionListener, KeyListener {

    // Costanti per il gioco
    private final int WIDTH = 800, HEIGHT = 600;
    private final int MONSTER_COUNT = 5;
    
    // Timer per aggiornare il gioco
    private Timer timer;
    
    // Il cacciatore
    private Hunter hunter;
    
    // Lista dei mostri
    private Monster[] monsters;

    // Stato del gioco
    private boolean gameOver;
    private int score;

    // Costruttore
    public MonsterHunterGame() {
        this.setPreferredSize(new Dimension(WIDTH, HEIGHT));
        this.setBackground(Color.BLACK);
        this.setFocusable(true);
        this.addKeyListener(this);
        
        hunter = new Hunter(100, 100);
        monsters = new Monster[MONSTER_COUNT];
        for (int i = 0; i < MONSTER_COUNT; i++) {
            monsters[i] = new Monster(100 + (i * 100), 200 + (i * 50));
        }

        score = 0;
        gameOver = false;

        timer = new Timer(16, this); // 60 FPS
        timer.start();
    }

    // Disegna gli elementi del gioco
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        if (gameOver) {
            // Visualizza Game Over
            g.setColor(Color.RED);
            g.setFont(new Font("Arial", Font.BOLD, 50));
            g.drawString("GAME OVER", WIDTH / 3, HEIGHT / 2);
            g.setFont(new Font("Arial", Font.PLAIN, 30));
            g.drawString("Punteggio: " + score, WIDTH / 3, HEIGHT / 2 + 50);
        } else {
            // Disegna il cacciatore
            g.setColor(Color.GREEN);
            g.fillRect(hunter.x, hunter.y, 50, 50);

            // Disegna i mostri
            for (Monster monster : monsters) {
                g.setColor(Color.RED);
                g.fillRect(monster.x, monster.y, 50, 50);
            }

            // Mostra l'HUD (Salute, punteggio)
            g.setColor(Color.WHITE);
            g.setFont(new Font("Arial", Font.PLAIN, 20));
            g.drawString("Salute: " + hunter.health, 10, 30);
            g.drawString("Punteggio: " + score, 10, 60);
        }
    }

    // Gestione degli aggiornamenti del gioco
    @Override
    public void actionPerformed(ActionEvent e) {
        if (!gameOver) {
            // Aggiornamento stato del cacciatore
            hunter.move();

            // Controlla collisioni e combattimento
            for (Monster monster : monsters) {
                if (hunter.x < monster.x + 50 && hunter.x + 50 > monster.x &&
                    hunter.y < monster.y + 50 && hunter.y + 50 > monster.y) {
                    // Combattimento
                    if (hunter.attacking) {
                        monster.health -= hunter.attack;
                        if (monster.health <= 0) {
                            score += 10;
                            monster.respawn();
                        }
                    }
                }
            }

            // Controlla se il cacciatore è morto
            if (hunter.health <= 0) {
                gameOver = true;
            }

            repaint();
        }
    }

    // Gestione dei tasti premuti
    @Override
    public void keyPressed(KeyEvent e) {
        if (gameOver) return;

        int key = e.getKeyCode();
        if (key == KeyEvent.VK_LEFT) {
            hunter.moveLeft();
        } else if (key == KeyEvent.VK_RIGHT) {
            hunter.moveRight();
        } else if (key == KeyEvent.VK_UP) {
            hunter.moveUp();
        } else if (key == KeyEvent.VK_DOWN) {
            hunter.moveDown();
        } else if (key == KeyEvent.VK_SPACE) {
            hunter.attack();
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {}

    @Override
    public void keyTyped(KeyEvent e) {}

    // Classe per il cacciatore
    class Hunter {
        int x, y, health, attack;
        boolean attacking;

        Hunter(int x, int y) {
            this.x = x;
            this.y = y;
            this.health = 100;
            this.attack = 20;
            this.attacking = false;
        }

        void move() {
            if (attacking) {
                attacking = false; // Rimuovi l'attacco dopo un colpo
            }
        }

        void moveLeft() { if (x > 0) x -= 10; }
        void moveRight() { if (x < WIDTH - 50) x += 10; }
        void moveUp() { if (y > 0) y -= 10; }
        void moveDown() { if (y < HEIGHT - 50) y += 10; }

        void attack() {
            attacking = true;
        }
    }

    // Classe per i mostri
    class Monster {
        int x, y, health, attack;

        Monster(int x, int y) {
            this.x = x;
            this.y = y;
            this.health = 50;
            this.attack = 10;
        }

        void respawn() {
            Random rand = new Random();
            this.x = rand.nextInt(WIDTH - 50);
            this.y = rand.nextInt(HEIGHT - 50);
            this.health = 50; // Reset health
        }
    }

    // Metodo main per avviare il gioco
    public static void main(String[] args) {
        JFrame frame = new JFrame("Monster Hunter Game");
        MonsterHunterGame game = new MonsterHunterGame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);
        frame.add(game);
        frame.setVisible(true);
    }
}
