# frozen_string_literal: true

require './app/model/grade'
require './app/model/student'
require './app/model/course'

class GradesController
  def self.cr_student
    @students = Student.students
    @crs = []
    @students.each do |student|
      @crs.push([student[0], Grade.cr_student(student[0], student[1]), student[1]])
    end
    @crs
  end

  def self.cr_course
    @courses = Course.courses

    @crs = []
    @courses.each do |course|
      @crs.push([course, Grade.cr_course(course)])
    end
    @crs
  end
end
