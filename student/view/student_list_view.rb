require './controller/student_list_controller.rb'
require './strategy/student_list.rb'
require 'fox16'
include Fox

class StudentApp < FXMainWindow

  attr_reader :items_per_page, :page_label
  attr_accessor :current_page
  
  def initialize(app)
    super(app, "students", width: 920, height: 600)

    @controller = StudentListController.new(self)
    @current_page = 1
    @items_per_page = 15

    tab_book = FXTabBook.new(self, nil, 0, LAYOUT_FILL_X | LAYOUT_FILL_Y)
    tab1 = FXTabItem.new(tab_book, "1", nil)
    @tab1_frame = FXHorizontalFrame.new(tab_book, LAYOUT_FILL_X | LAYOUT_FILL_Y)

    tab2 = FXTabItem.new(tab_book, "2")
    FXVerticalFrame.new(tab_book, LAYOUT_FILL).tap do |frame|
      FXLabel.new(frame, nil, nil, LAYOUT_CENTER_X)
    end
    tab3 = FXTabItem.new(tab_book, "3")
    FXVerticalFrame.new(tab_book, LAYOUT_FILL).tap do |frame|
      FXLabel.new(frame, nil, nil, LAYOUT_CENTER_X)
    end

    filter_frame = FXVerticalFrame.new(@tab1_frame, FRAME_SUNKEN | LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 170)
    FXLabel.new(filter_frame, "ФИО:")
    @name_field = FXTextField.new(filter_frame, 25, nil, 0, TEXTFIELD_NORMAL | LAYOUT_FILL_X)

    create_filter_frame(filter_frame, "github:")
    create_filter_frame(filter_frame, "email:")
    create_filter_frame(filter_frame, "phone:")
    create_filter_frame(filter_frame, "telegram:")
    create_table_frame
    create_buttons_frame
    update_button_states

    self.connect(SEL_CLOSE) do
      app.exit
    end 
    
    @controller.refresh_data  
  end

  def create_buttons_frame
    button_frame = FXVerticalFrame.new(@tab1_frame, FRAME_SUNKEN | LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 100)
    @add_btn = FXButton.new(button_frame, "Добавить", nil, nil, 0, BUTTON_NORMAL | LAYOUT_FILL_X)
    @edit_btn =FXButton.new(button_frame, "Изменить", nil, nil, 0, BUTTON_NORMAL | LAYOUT_FILL_X)
    @delete_btn = FXButton.new(button_frame, "Удалить", nil, nil, 0, BUTTON_NORMAL | LAYOUT_FILL_X)
    @update_btn = FXButton.new(button_frame, "Обновить", nil, nil, 0, BUTTON_NORMAL | LAYOUT_FILL_X)
    @update_btn.connect(SEL_COMMAND) { on_update }
  end

  def create_table_frame
    table_frame = FXVerticalFrame.new(@tab1_frame, FRAME_SUNKEN | LAYOUT_FILL_X | LAYOUT_FILL_Y)
    @student_table = FXTable.new(table_frame, nil, 0, TABLE_COL_SIZABLE | LAYOUT_FILL | TABLE_READONLY)
    controls = FXHorizontalFrame.new(table_frame, opts:LAYOUT_CENTER_X)
    prev_btn = FXButton.new(controls, "<")
    @page_label = FXLabel.new(controls, "страница: 1/1", nil, JUSTIFY_CENTER_X)
    next_btn = FXButton.new(controls, ">")
    prev_btn.connect(SEL_COMMAND) { change_page(-1) }
    next_btn.connect(SEL_COMMAND) { change_page(1) }
    @student_table.connect(SEL_SELECTED) { update_button_states }
    @student_table.connect(SEL_DESELECTED) { update_button_states }
    @student_table.columnHeader.connect(SEL_COMMAND) do |_, _, sel|
      column_index = sel
      if column_index == 1
        @controller.sort_by_fullname!
      end
      @controller.refresh_data 
    end 
  end

  def create_filter_frame(frame, label_text)
    FXLabel.new(frame, label_text)
    combo = FXComboBox.new(frame, 3, nil, 0, COMBOBOX_STATIC | LAYOUT_FILL_X)
    combo.numVisible = 3
    combo.appendItem("да")
    combo.appendItem("нет")
    combo.appendItem("не важно")
    combo.setCurrentItem(2)

    input_field = FXTextField.new(frame, 25, nil, 0, TEXTFIELD_NORMAL | LAYOUT_FILL_X)
    input_field.enabled = false

    combo.connect(SEL_COMMAND) do
      if combo.currentItem == 0
        input_field.enabled = true
      else
        input_field.enabled = false
        input_field.text = "" 
      end
    end
  end

  def get_selected_rows
    selected_rows = []
    (0...@student_table.numRows).each do |row|
        selected_rows << row if @student_table.rowSelected?(row)
    end
    selected_rows
  end

  def update_button_states
      selected_rows = get_selected_rows
      case selected_rows.size
      when 0
          @edit_btn.enabled = false
          @delete_btn.enabled = false
      when 1
          @edit_btn.enabled = true
          @delete_btn.enabled = true
      else
          @edit_btn.enabled = false
          @delete_btn.enabled = true
      end
  end

  def on_update()
    @current_page = 1
    @controller.update
  end

  def set_column_widths
    @student_table.setColumnWidth(0, 50)  
    @student_table.setColumnWidth(1, 100) 
    @student_table.setColumnWidth(2, 235) 
    @student_table.setColumnWidth(3, 130) 
  end

  def set_table_params(column_names, whole_entities_count)
    @page_label.text = "страница: #{@current_page}/#{whole_entities_count}"
    @student_table.setTableSize(15, 4)
    column_names.each_with_index do |name, index|
      @student_table.setColumnText(index, name) 
    end
  end

  def set_table_data(data_table)
    offset = (@current_page - 1) * @items_per_page

    (0...data_table.row_count).each do |row_index|
      (0...data_table.column_count).each do |col_index|
        value = data_table.get_element(row_index, col_index).to_s
        value = (row_index + 1 + offset).to_s if col_index == 0
        @student_table.setItemText(row_index, col_index, value)
      end
    end
    set_column_widths
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  private

  def update_pagination(current_page, total_pages)
    @controller.update_pagination(current_page, total_pages)
  end

  def change_page(page)
    @controller.change_page(page)
  end

end
