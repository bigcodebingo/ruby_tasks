require 'yaml'
require_relative 'interface'

class StudentsListYAML < StorageStrategy

    def read_from_file(file_path)
        return [] unless File.exist?(file_path)
        raw_data = YAML.load(File.read(file_path), symbolize_names: true)
        raw_data.map { |student_data| Student.new(**student_data) }
    end

    def save_to_file(file_path, data)
        yaml_data = YAML.dump(data)
        File.write(file_path, yaml_data)
    end

end