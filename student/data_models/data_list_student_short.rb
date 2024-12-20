require_relative 'data_list.rb'
require_relative 'data_table.rb'

class DataListStudentShort < DataList

    def initialize(data)
      super(data)
    end

    def get_names 
      ["№", "fullname", "github", "contact"]
    end

    def make_row(index)
      [index + 1, @data[index].fullname, @data[index].contact, @data[index].github]
    end

end
