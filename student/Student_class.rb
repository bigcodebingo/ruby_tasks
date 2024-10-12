class Student

    attr_reader :id, :name, :surname, :lastname
    attr_accessor :phone, :telegram, :email, :github
      
    def initialize(id, name, surname, lastname, phone: nil, telegram: nil, email: nil, github: nil)
        @id = id
        @name = name
        @surname = surname
        @lastname = lastname
        @phone = phone
        @telegram = telegram
        @email = email
        @github = github
      end
      
      def full_name
        "#{@surname} #{@name[0]}#{'.'}#{@lastname[0]}"
      end

      def to_s
        "id: #{@id}, fullname: #{full_name}, phone: #{@phone || 'empty'}, tg: #{@telegram || 'empty'}, email: #{@email || 'empty'}, git: #{@github || 'empty'}"
      end
end
