package hotel;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Hotel implements Serializable {
    private static final long serialVersionUID = 1L;

    private List<Camera> camere;
    private List<Prenotazione> prenotazioni;

    public Hotel() {
        camere = new ArrayList<>();
        prenotazioni = new ArrayList<>();
    }

    public void aggiungiCamera(Camera camera) {
        camere.add(camera);
    }

    public List<Camera> getCamereDisponibili() {
        List<Camera> camereDisponibili = new ArrayList<>();
        for (Camera camera : camere) {
            if (camera != null && !camera.isOccupata()) {  
                camereDisponibili.add(camera);
            }
        }
        return camereDisponibili;
    }
    

    public void nuovaPrenotazione(Prenotazione p) {
        prenotazioni.add(p);
    }

    public void mostraPrenotazioni() {
        for (Prenotazione prenotazione : prenotazioni) {
            System.out.println(prenotazione.toString());
        }
    }

    public double incassoTotale() {
        double incasso = 0;
        for (Prenotazione prenotazione : prenotazioni) {
            incasso += prenotazione.calcolaTotale();
        }
        return incasso;
    }

    public List<Prenotazione> cercaPrenotazionePerCliente(String email) {
        List<Prenotazione> prenotazioniTrovate = new ArrayList<>();
        for (Prenotazione prenotazione : prenotazioni) {
            if (prenotazione.emailCliente().equals(email)) {
                prenotazioniTrovate.add(prenotazione);
            }
        }
        return prenotazioniTrovate;
    }

    public void salvaStato(String fileName) {
        try (ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(fileName))) {
            out.writeObject(this); 
            System.out.println("Stato salvato correttamente.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Hotel caricaStato(String fileName) {
        try (ObjectInputStream in = new ObjectInputStream(new FileInputStream(fileName))) {
            return (Hotel) in.readObject(); 
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
}
