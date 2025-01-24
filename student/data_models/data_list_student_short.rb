require_relative 'data_list.rb'
require_relative 'data_table.rb'

class DataListStudentShort < DataList

    attr_accessor :observers, :count

    def initialize(data)
      super(data)
      @observers = []
    end
    
    def add_observer(observer)
      @observers << observer
    end
  
    def remove_observer(observer)   
      @observers.delete(observer)
    end
  
    def notify
      @observers.each do |observer|
        observer.set_table_params(self.get_names, @count)
        observer.set_table_data(self.get_data)
      end
    end

    private

    def get_names 
      ["№", "ФИО", "Github", "Контакт"]
    end

    def make_row(index)
      [index+1, @data[index].fullname, @data[index].github, @data[index].get_contact]
    end

end
