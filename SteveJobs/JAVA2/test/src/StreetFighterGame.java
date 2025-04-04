import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class StreetFighterGame extends JPanel implements ActionListener, KeyListener {

    private Character player1, player2;
    private Timer timer;

    public StreetFighterGame() {
        player1 = new Character(50, 300, 1); // player1 start position
        player2 = new Character(700, 300, 2); // player2 start position

        timer = new Timer(20, this);
        timer.start();
        
        addKeyListener(this);
        setFocusable(true);
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        
        // Draw background
        g.setColor(Color.LIGHT_GRAY);
        g.fillRect(0, 0, getWidth(), getHeight());
        
        // Draw characters
        player1.draw(g);
        player2.draw(g);

        // Draw health bars
        player1.drawHealth(g, 20, 20);
        player2.drawHealth(g, getWidth() - 220, 20);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        // Move players, handle attacks and collisions
        player1.update();
        player2.update();
        
        // Collision detection for attacks
        if (player1.isAttacking() && player1.getBounds().intersects(player2.getBounds())) {
            player2.takeDamage(10); // Player 2 takes damage
        }
        if (player2.isAttacking() && player2.getBounds().intersects(player1.getBounds())) {
            player1.takeDamage(10); // Player 1 takes damage
        }

        repaint();
    }

    @Override
    public void keyPressed(KeyEvent e) {
        int key = e.getKeyCode();
        
        // Player 1 controls (W, A, S, D for movement, Space for attack)
        if (key == KeyEvent.VK_W) {
            player1.jump();
        }
        if (key == KeyEvent.VK_A) {
            player1.moveLeft();
        }
        if (key == KeyEvent.VK_D) {
            player1.moveRight();
        }
        if (key == KeyEvent.VK_SPACE) {
            player1.attack();
        }

        // Player 2 controls (Arrow keys for movement, Enter for attack)
        if (key == KeyEvent.VK_UP) {
            player2.jump();
        }
        if (key == KeyEvent.VK_LEFT) {
            player2.moveLeft();
        }
        if (key == KeyEvent.VK_RIGHT) {
            player2.moveRight();
        }
        if (key == KeyEvent.VK_ENTER) {
            player2.attack();
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {}

    @Override
    public void keyTyped(KeyEvent e) {}

    public static void main(String[] args) {
        JFrame frame = new JFrame("Street Fighter Game");
        StreetFighterGame gamePanel = new StreetFighterGame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);
        frame.add(gamePanel);
        frame.setVisible(true);
    }

    // Character class to represent the fighter
    class Character {
        private int x, y;
        private int health = 100;
        private int speed = 5;
        private int attackPower = 10;
        private boolean isJumping = false;
        private boolean isAttacking = false;
        private Rectangle bounds;
        private int id; // Player ID: 1 or 2

        public Character(int x, int y, int id) {
            this.x = x;
            this.y = y;
            this.id = id;
            bounds = new Rectangle(x, y, 50, 100); // Default size of character
        }

        public void update() {
            // Simulate gravity or jumping behavior
            if (isJumping) {
                y -= 10;
                if (y <= 150) {
                    isJumping = false;
                }
            } else if (y < 300) {
                y += 10;
            }
        }

        public void moveLeft() {
            if (x > 0) x -= speed;
        }

        public void moveRight() {
            if (x < getWidth() - 50) x += speed;
        }

        public void jump() {
            if (!isJumping) {
                isJumping = true;
            }
        }

        public void attack() {
            isAttacking = true;
        }

        public void takeDamage(int damage) {
            health -= damage;
            if (health < 0) health = 0;
        }

        public void draw(Graphics g) {
            // Draw the character's sprite (just a rectangle for now)
            if (id == 1) {
                g.setColor(Color.BLUE);
            } else {
                g.setColor(Color.RED);
            }
            g.fillRect(x, y, 50, 100); // Draw the character as a rectangle

            // Draw attack animation (e.g., just change color when attacking)
            if (isAttacking) {
                g.setColor(Color.YELLOW); // Highlight when attacking
                g.fillRect(x + 50, y + 40, 30, 30); // Draw an "attack" area
                isAttacking = false;
            }
        }

        public void drawHealth(Graphics g, int x, int y) {
            g.setColor(Color.RED);
            g.fillRect(x, y, 200, 20); // Draw health bar background
            g.setColor(Color.GREEN);
            g.fillRect(x, y, 2 * health, 20); // Draw health bar foreground
        }

        public Rectangle getBounds() {
            return bounds;
        }

        public boolean isAttacking() {
            return isAttacking;
        }
    }
}
