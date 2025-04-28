import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;

public class EpicInventoryApp {

    // Liste di opzioni con immagini (Sostituisci i percorsi con le tue immagini)
    private static String[] weapons = {"Spada", "Ascia", "Lancia", "Arco", "Pugnale", "Mazza", "Spada Magica", "Balestra"};
    private static String[] armors = {"Armatura di Ferro", "Armatura di Pelle", "Armatura Magica", "Armatura di Drago", "Tunica Leggera"};
    private static String[] foods = {"Pane", "Carne", "Mele", "Zuppa", "Formaggio", "Frutta Selvaggia"};
    private static String[] potions = {"Pozione di Vita", "Pozione di Mana", "Pozione di Forza", "Pozione di Invisibilità"};
    private static String[] accessories = {"Anello della Forza", "Amuleto della Saggezza", "Bracciale di Protezione", "Ciondolo della Magia"};

    // ArrayList per memorizzare gli oggetti selezionati
    private static ArrayList<String> selectedItems = new ArrayList<>();

    // Componenti GUI
    private static DefaultListModel<String> inventoryModel = new DefaultListModel<>();
    private static JList<String> inventoryList = new JList<>(inventoryModel);
    private static JButton addButton, removeButton;
    private static JLabel backgroundLabel;

    public static void main(String[] args) {
        JFrame frame = new JFrame("Epic Inventory");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(900, 650);
        frame.setLayout(new BorderLayout());

        // Pannello principale
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BorderLayout());

        // SFONDO DINAMICO (Un'immagine epica che scorre)
        backgroundLabel = new JLabel(new ImageIcon("background.gif")); // Sostituisci con un'immagine GIF che scorre
        backgroundLabel.setLayout(new FlowLayout(FlowLayout.CENTER));
        frame.add(backgroundLabel, BorderLayout.CENTER);

        // Pannello laterale per categorie
        JPanel categoryPanel = new JPanel();
        categoryPanel.setLayout(new BoxLayout(categoryPanel, BoxLayout.Y_AXIS));
        categoryPanel.setBackground(new Color(25, 25, 112)); // Un blu scuro profondo

        JLabel titleLabel = new JLabel("Seleziona il Tuo Equipaggiamento");
        titleLabel.setForeground(Color.WHITE);
        titleLabel.setFont(new Font("Algerian", Font.BOLD, 22));
        titleLabel.setAlignmentX(Component.CENTER_ALIGNMENT);

        categoryPanel.add(titleLabel);
        categoryPanel.add(Box.createVerticalStrut(30));

        // Categorie: Aggiungi pulsanti per ogni categoria
        createCategoryButton(categoryPanel, "Armi", weapons, "sword_icon.png");
        createCategoryButton(categoryPanel, "Armature", armors, "armor_icon.png");
        createCategoryButton(categoryPanel, "Cibi", foods, "food_icon.png");
        createCategoryButton(categoryPanel, "Pozioni", potions, "potion_icon.png");
        createCategoryButton(categoryPanel, "Accessori", accessories, "accessory_icon.png");

        // Pannello centrale per inventario
        JPanel inventoryPanel = new JPanel();
        inventoryPanel.setLayout(new BorderLayout());
        inventoryPanel.setBackground(new Color(30, 30, 30, 200)); // Translucente con colore scuro

        JLabel inventoryLabel = new JLabel("Inventario Selezionato");
        inventoryLabel.setForeground(Color.WHITE);
        inventoryLabel.setFont(new Font("Verdana", Font.BOLD, 18));
        inventoryPanel.add(inventoryLabel, BorderLayout.NORTH);

        JScrollPane inventoryScrollPane = new JScrollPane(inventoryList);
        inventoryPanel.add(inventoryScrollPane, BorderLayout.CENTER);

        // Pannello per i bottoni Aggiungi e Rimuovi
        JPanel buttonPanel = new JPanel();
        addButton = new JButton("Aggiungi");
        removeButton = new JButton("Rimuovi");

        addButton.setBackground(new Color(34, 139, 34));
        removeButton.setBackground(new Color(255, 69, 0));

        addButton.setFont(new Font("Arial", Font.BOLD, 14));
        removeButton.setFont(new Font("Arial", Font.BOLD, 14));

        buttonPanel.setBackground(new Color(0, 0, 0, 150)); // Sfumato
        buttonPanel.add(addButton);
        buttonPanel.add(removeButton);

        inventoryPanel.add(buttonPanel, BorderLayout.SOUTH);

        // Pannello finale
        JPanel containerPanel = new JPanel();
        containerPanel.setLayout(new BorderLayout());
        containerPanel.add(categoryPanel, BorderLayout.WEST);
        containerPanel.add(inventoryPanel, BorderLayout.CENTER);

        mainPanel.add(containerPanel, BorderLayout.CENTER);

        frame.add(mainPanel);

        // Mostra il frame
        frame.setVisible(true);

        // Eventi dei pulsanti
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String selectedWeapon = (String) JOptionPane.showInputDialog(frame, "Scegli un'arma", "Seleziona Arma", JOptionPane.QUESTION_MESSAGE, null, weapons, weapons[0]);
                String selectedArmor = (String) JOptionPane.showInputDialog(frame, "Scegli un'armatura", "Seleziona Armatura", JOptionPane.QUESTION_MESSAGE, null, armors, armors[0]);
                String selectedFood = (String) JOptionPane.showInputDialog(frame, "Scegli un cibo", "Seleziona Cibo", JOptionPane.QUESTION_MESSAGE, null, foods, foods[0]);
                String selectedPotion = (String) JOptionPane.showInputDialog(frame, "Scegli una pozione", "Seleziona Pozione", JOptionPane.QUESTION_MESSAGE, null, potions, potions[0]);
                String selectedAccessory = (String) JOptionPane.showInputDialog(frame, "Scegli un accessorio", "Seleziona Accessorio", JOptionPane.QUESTION_MESSAGE, null, accessories, accessories[0]);

                // Aggiungi l'oggetto all'inventario
                addItemToInventory(selectedWeapon);
                addItemToInventory(selectedArmor);
                addItemToInventory(selectedFood);
                addItemToInventory(selectedPotion);
                addItemToInventory(selectedAccessory);
            }
        });

        removeButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String selectedItem = inventoryList.getSelectedValue();
                if (selectedItem != null) {
                    selectedItems.remove(selectedItem);
                    inventoryModel.removeElement(selectedItem);
                } else {
                    JOptionPane.showMessageDialog(frame, "Seleziona un oggetto da rimuovere", "Errore", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
    }

    // Funzione per aggiungere un elemento all'inventario
    private static void addItemToInventory(String item) {
        if (item != null && !selectedItems.contains(item)) {
            selectedItems.add(item);
            inventoryModel.addElement(item);
        }
    }

    // Funzione per creare un pulsante categoria con icona
    private static void createCategoryButton(JPanel categoryPanel, String category, String[] items, String iconPath) {
        JButton button = new JButton(category, new ImageIcon(iconPath));
        button.setFont(new Font("Arial", Font.BOLD, 16));
        button.setBackground(new Color(47, 79, 79));
        button.setForeground(Color.WHITE);
        button.setPreferredSize(new Dimension(180, 50));
        button.setFocusPainted(false);
        button.setAlignmentX(Component.CENTER_ALIGNMENT);
        
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String selectedItem = (String) JOptionPane.showInputDialog(null, "Seleziona un " + category.toLowerCase(), category, JOptionPane.QUESTION_MESSAGE, null, items, items[0]);
                if (selectedItem != null) {
                    addItemToInventory(selectedItem);
                }
            }
        });
        
        categoryPanel.add(button);
        categoryPanel.add(Box.createVerticalStrut(10));
    }
}
