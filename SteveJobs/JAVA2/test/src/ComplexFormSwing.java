import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class ComplexFormSwing {

    // Componenti dell'interfaccia grafica
    private static JTextField nameField, ageField, emailField;
    private static JRadioButton maleRadio, femaleRadio;
    private static JCheckBox newsletterCheck;
    private static JButton saveButton;

    public static void main(String[] args) {
        // Creazione della finestra principale
        JFrame frame = new JFrame("Form di Registrazione");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 300);
        frame.setLayout(new BorderLayout());

        // Pannello per il form
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(6, 2));

        // Nome
        panel.add(new JLabel("Nome:"));
        nameField = new JTextField();
        panel.add(nameField);

        // Età
        panel.add(new JLabel("Età:"));
        ageField = new JTextField();
        panel.add(ageField);

        // Email
        panel.add(new JLabel("Email:"));
        emailField = new JTextField();
        panel.add(emailField);

        // Sesso
        panel.add(new JLabel("Sesso:"));
        JPanel genderPanel = new JPanel();
        maleRadio = new JRadioButton("Maschio");
        femaleRadio = new JRadioButton("Femmina");
        ButtonGroup genderGroup = new ButtonGroup();
        genderGroup.add(maleRadio);
        genderGroup.add(femaleRadio);
        genderPanel.add(maleRadio);
        genderPanel.add(femaleRadio);
        panel.add(genderPanel);

        // Newsletter
        panel.add(new JLabel("Iscriviti alla newsletter:"));
        newsletterCheck = new JCheckBox();
        panel.add(newsletterCheck);

        // Aggiunta al frame
        frame.add(panel, BorderLayout.CENTER);

        // Pannello per il pulsante di salvataggio
        JPanel buttonPanel = new JPanel();
        saveButton = new JButton("Salva");
        buttonPanel.add(saveButton);
        frame.add(buttonPanel, BorderLayout.SOUTH);

        // Azione quando si preme il pulsante di salvataggio
        saveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                saveDataToFile();
            }
        });

        // Visualizzazione della finestra
        frame.setVisible(true);
    }

    private static void saveDataToFile() {
        // Recupera i dati dai campi
        String name = nameField.getText();
        String age = ageField.getText();
        String email = emailField.getText();
        String gender = maleRadio.isSelected() ? "Maschio" : (femaleRadio.isSelected() ? "Femmina" : "Non specificato");
        boolean newsletter = newsletterCheck.isSelected() ? true : false;

        // Crea una stringa con i dati formattati
        String data = "Nome: " + name + "\n" +
                      "Età: " + age + "\n" +
                      "Email: " + email + "\n" +
                      "Sesso: " + gender + "\n" +
                      "Iscritto alla newsletter: " + (newsletter ? "Sì" : "No") + "\n\n";

        // Scrivi i dati su un file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("dati_form.txt", true))) {
            writer.write(data);
            JOptionPane.showMessageDialog(null, "Dati salvati con successo!");
        } catch (IOException e) {
            JOptionPane.showMessageDialog(null, "Errore durante il salvataggio dei dati.");
            e.printStackTrace();
        }
    }
}
