package Mascotas;

public enum Especie {
  GATO {
    @Override
    public boolean isGato() {
      return true;
    }
    @Override
    public boolean isPerro() {
      return false;
    }
  },
  PERRO {
    @Override
    public boolean isGato() {
      return false;
    }
    @Override
    public boolean isPerro() {
      return true;
    }
  };

  public abstract boolean isGato();

  public abstract boolean isPerro();
}
