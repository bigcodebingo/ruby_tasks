require './data_models/data_list_student_short.rb'
require './strategy/student_list.rb'

class StudentListController

    def initialize(view)
        @view = view
        @student_list = StudentsList.new("./students.json", StudentsListJSON.new)
        @data_list = DataListStudentShort.new([])
	@data_list.add_observer(@view)
    end

    def sort_by_fullname!
        @student_list.sort_by_fullname!
    end

    def refresh_data
        total_students = @student_list.get_student_short_count
        total_pages = (total_students.to_f / @view.items_per_page).ceil
        @student_list.get_k_n_student_short_list(@view.current_page, @view.items_per_page, @data_list)
        @data_list.count = total_students
        @data_list.notify
        update_pagination(@view.current_page, total_pages) 
      end
    
    def update_pagination(current_page, total_pages)
        @view.page_label.text = "Страница: #{current_page}/#{total_pages}"
    end

    def change_page(page)
        total_students = @student_list.get_student_short_count
        total_pages = (total_students.to_f / @view.items_per_page).ceil

        new_page = @view.current_page + page
        return if new_page < 1 || new_page > total_pages

        @view.current_page = new_page
        refresh_data
        update_pagination(@view.current_page, total_pages)
    end

    def update()
	refresh_data
    end
	
end
