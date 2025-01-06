class StorageStrategy

    def read_from_file(file_path)
        raise NotImplementedError, "#{self.class} должен реализовать #read_from_file"
    end

    def save_to_file(file_path, data)
        raise NotImplementedError, "#{self.class} должен реализовать #save_to_file"
    end
    
end