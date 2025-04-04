package hotel;

import java.io.Serializable;

public class Prenotazione implements Serializable {
    private static final long serialVersionUID = 1L;

    private Cliente cliente;
    private Camera camera;
    private int numeroNotti;

    public Prenotazione(Cliente cliente, Camera camera, int numeroNotti) {
        this.cliente = cliente;
        this.camera = camera;
        this.numeroNotti = numeroNotti;
    }

    @Override
    public String toString() {
        return "Prenotazione{" +
                "Cliente='" + cliente.getNome() + " " + cliente.getCognome() + " " + cliente.getEmail() + '\'' +
                ", Camera=" + camera.getNumeroCamera() + " " + camera.getTipoCamera() +
                ", Numero Notti=" + numeroNotti +
                '}';
    }

    public String emailCliente() {
        return cliente.getEmail();
    }

    public double PrezzoPerNotte() {
        return camera.getPrezzoPerNotte();
    }

    public double calcolaTotale() {
        return camera.getPrezzoPerNotte() * numeroNotti;
    }
}
