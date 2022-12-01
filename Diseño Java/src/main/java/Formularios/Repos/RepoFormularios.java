package Formularios.Repos;

import Formularios.EncontradaConChapita;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class RepoFormularios {
  private List<EncontradaConChapita> formularios;

  public RepoFormularios(){
    this.formularios = new ArrayList<>();
  }

  public void cargarFormularios(EncontradaConChapita... unosFormularios){
    Collections.addAll(this.formularios, unosFormularios);
  }

  public List<EncontradaConChapita> getFormularios() {
    return formularios;
  }

  public List<EncontradaConChapita> formularioUltimosDiezDias(){
    LocalDate fechaActual = LocalDate.now();
    List<EncontradaConChapita> ultimosFormularios = this.formularios.stream().
        filter(form -> this.diferenciaEntreFechas(form.getMascotaEncontrada().getFecha(),fechaActual) <= 10
                && 0 <= this.diferenciaEntreFechas(form.getMascotaEncontrada().getFecha(),fechaActual)).
        collect(Collectors.toList());
    return ultimosFormularios;
  }
  // Toma dos fechas y saca la diferencia de dias
  public long diferenciaEntreFechas(LocalDate fecha1 , LocalDate fecha2){
    long diferenciaEntreFechas = ChronoUnit.DAYS.between(fecha1, fecha2);
    return diferenciaEntreFechas;
  }



}
