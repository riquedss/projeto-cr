# frozen_string_literal: true

class Grade
  require 'csv'

  NOTAS = CSV.read('./db/notas.csv')

  def self.cr_student(matricula, codigo_turma)
    @carga_horaria_total = 0
    @nota_ponderada = 0

    NOTAS.each do |nota|
      if nota[0] == matricula.to_s && nota[2] == codigo_turma.to_s
        @nota_ponderada += nota[3].to_i * nota[4].to_i
        @carga_horaria_total += nota[4].to_i
      end
    end

    divisao(@nota_ponderada, @carga_horaria_total)
  end

  def self.cr_course(cod_course)
    @carga_horaria_total = 0
    @nota_ponderada = 0

    NOTAS.each do |nota|
      if nota[2] == cod_course.to_s
        @nota_ponderada += nota[3].to_i * nota[4].to_i
        @carga_horaria_total += nota[4].to_i
      end
    end

    divisao(@nota_ponderada, @carga_horaria_total)
  end

  def self.divisao(divisor, dividendo)
    return divisor / dividendo if dividendo != 0
  end
end
