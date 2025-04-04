package hotel;

import java.io.Serializable;

public class Camera implements Serializable {
    private static final long serialVersionUID = 1L;

    private int numeroCamera;
    private String tipoCamera;
    private double prezzoPerNotte;
    private boolean occupata;
    private Cliente cliente;

    public Camera(int numeroCamera, String tipoCamera, double prezzoPerNotte) {
        this.numeroCamera = numeroCamera;
        this.tipoCamera = tipoCamera;
        this.prezzoPerNotte = prezzoPerNotte;
        this.occupata = false;
        this.cliente = null;
    }

    @Override
    public String toString() {
        return "Camera{" +
                "Numero Camera=" + numeroCamera +
                ", Tipo Camera='" + tipoCamera + '\'' +
                ", Prezzo Per Notte=" + prezzoPerNotte +
                ", Occupata=" + occupata +
                ", Cliente=" + (cliente != null ? cliente.getNome() + " " + cliente.getCognome() : "Nessun cliente") +
                '}';
    }

    public int getNumeroCamera() {
        return numeroCamera;
    }

    public String getTipoCamera() {
        return tipoCamera;
    }

    public double getPrezzoPerNotte() {
        return prezzoPerNotte;
    }

    public boolean isOccupata() {
        return occupata;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setOccupata(boolean occupata) {
        this.occupata = occupata;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
