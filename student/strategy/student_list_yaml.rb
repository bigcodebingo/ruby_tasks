require 'yaml'
require_relative 'student_short'
require_relative 'student'
require_relative './data_models/data_list.rb'
require_relative 'student_list'

class StudentsListYAML < StudentsList

    def read_from_file
        return [] unless File.exist?(@file_path)
        YAML.load(File.read(@file_path), symbolize_names: true).map do |student|
          Student.new(**student)
        end
    end

    def save_to_file
        to_data_hash = @students.map { |student| student.to_h }
        yaml_data = YAML.dump(to_data_hash)
        File.write(@file_path, yaml_data)
    end

end