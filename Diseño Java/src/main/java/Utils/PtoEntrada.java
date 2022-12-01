package Utils;

import Mascotas.Mascota;

public class PtoEntrada {

    public void notificarQueAlguienQuiereAdoptar( Mascota mascota){
        mascota.getDuenio().notificar("Alguien quiere adoptar una mascota!");
    }
}
