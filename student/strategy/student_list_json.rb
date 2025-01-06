require 'json'
require_relative 'interface'

class StudentsListJSON < StorageStrategy

    def read_from_file(file_path)
        return [] unless File.exist?(file_path)
        raw_data = JSON.parse(File.read(file_path), symbolize_names: true)
        raw_data.map { |student_data| Student.new(**student_data) }
    end
    
    def save_to_file(file_path, data)
      json_data = JSON.pretty_generate(data)
      File.write(file_path, json_data)
    end

end
