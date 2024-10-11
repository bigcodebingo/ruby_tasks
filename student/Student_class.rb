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
        "#{@surname} #{@name} #{@lastname}"
      end
      
      def  set_id(id)
        @id = id
      end

      def surname=(surname)
        @surname = surname
      end
    
      def name=(name)
        @name = name
      end
    
      def lastname=(lastname)
        @lastname = lastname
      end
end
