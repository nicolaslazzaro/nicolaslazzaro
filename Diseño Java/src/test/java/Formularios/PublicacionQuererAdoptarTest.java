package Formularios;

/*
public class PublicacionQuererAdoptarTest {


    private static Persona unaPersona;
    private static Duenio unAdoptante;
    private static Preferencia unaPreferencia;
    private static Comodidad unaComodidad;
    private static List<Contacto> contactos;
    private static List<Preferencia> preferencias;
    private static List<Comodidad> comodidades;
    private static DefinicionPreferencia animal;
    private static DefinicionComodidad tamanioCasa;
    private static PublicacionQuererAdoptar unaPublicacionQuererAdoptar;
    private static Contacto unContacto;

    @BeforeAll
    static void inicializarTest() {
      unaPersona = new Persona("carlos1234",
          "Bala", LocalDate.now(), TipoDocumento.DNI,12345678, new ArrayList<>());
      unAdoptante = new Duenio("Carlos",new Contrasenia("cqueir5862@1"),unaPersona);

      RepoPreferencias.getInstance().getPreferencias().add(animal);
      unaPreferencia = new Preferencia(animal, "Gato");
      RepoComodidades.getInstance().getComodidad().add((tamanioCasa));
      unaComodidad = new Comodidad(tamanioCasa,"Grande");
      unContacto= new Contacto("carlos","Bala",123546,"email@email.com");
      unAdoptante.registrarContactos(unContacto);

      preferencias = new ArrayList<>();
      preferencias.add(unaPreferencia);
      comodidades = new ArrayList<>();
      comodidades.add(unaComodidad);
      contactos = new ArrayList<>();
      contactos.add(unContacto);

      unaPublicacionQuererAdoptar = new PublicacionQuererAdoptar(preferencias,comodidades, unAdoptante);
    }

    @Test
    public void unAdoptanteQueireAdoptar() {
      Assertions.assertEquals(unaPublicacionQuererAdoptar.getContactos(),
            unAdoptante.contactos());
      Assertions.assertEquals(unaPublicacionQuererAdoptar.getComodidades(),
            unAdoptante.quererAdoptar(preferencias,comodidades).getComodidades());
      Assertions.assertEquals(unaPublicacionQuererAdoptar.getLink(),
            unAdoptante.quererAdoptar(preferencias,comodidades).getLink());
      Assertions.assertEquals(unaPublicacionQuererAdoptar.getPreferencias(),
            unAdoptante.quererAdoptar(preferencias,comodidades).getPreferencias());
      Assertions.assertEquals(unaPublicacionQuererAdoptar.getFecha(),
            unAdoptante.quererAdoptar(preferencias,comodidades).getFecha());

    }
}
*/