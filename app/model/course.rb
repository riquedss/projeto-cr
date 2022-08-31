# frozen_string_literal: true

class Course
  require 'csv'

  NOTAS = CSV.read('./db/notas.csv')

  def self.courses
    @courses = []

    NOTAS.each do |nota|
      @courses.push(nota[2]) unless find(nota[2])
    end
    @courses[1, @courses.length + 1]
  end

  def self.find(cod_course)
    @courses.each do |course|
      return course if course == cod_course
    end
    false
  end
end
