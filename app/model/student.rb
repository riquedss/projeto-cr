# frozen_string_literal: true

class Student
  require 'csv'

  NOTAS = CSV.read('./db/notas.csv')

  def self.students
    @students = []

    NOTAS.each do |nota|
      @students.push([nota[0], nota[2]]) unless find(nota[0], nota[2])
    end
    @students[1, @students.length + 1]
  end

  def self.find(matricula, codigo_turma)
    @students.each do |student|
      return student if student[0] == matricula && student[1] == codigo_turma
    end
    false
  end
end
