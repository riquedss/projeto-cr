# frozen_string_literal: true

require './app/controller/grades_controller'

def commands_grades
  print " ________________________________________________________________________\n"
  print "|                              COMANDOS                                  |\n"
  print "|                                                                        |\n"
  print "|(1) Mostrar cr de todos os alunos                                       |\n"
  print "|(2) Mostrar média de CR dos cursos                                      |\n"
  print "|(-1) sair                                                               |\n"
  print "|________________________________________________________________________|\n"
end

def lista_cr_student(crs)
  print " --------------------------- O CR dos alunos é: --------------------------\n"
  print " Matricula | Cr | COD_Curso \n"
  crs.each do |cr|
    print "    #{cr[0]}   | #{cr[1]} |  #{cr[2]}\n"
  end
end

def lista_cr_course(crs)
  print " --------------------------- O CR dos cursos é: --------------------------\n"
  print " COD_Curso | Cr \n"
  crs.each do |cr|
    print "    #{cr[0]}   | #{cr[1]} \n"
  end
end

def routes_grades
  commands_grades
  print('>')
  case gets.chomp.to_i
  when 1
    lista_cr_student(GradesController.cr_student)
    true
  when 2
    lista_cr_course(GradesController.cr_course)
    true
  when -1
    puts "\nPrograma finalizado!"
    false
  else
    puts "\nErro: Comando inválido."
    true
  end
end
