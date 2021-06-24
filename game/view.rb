class View
  def initialize(app)
    #puts "  initializing view"
    @app = app
  end

  def run(answer)
    if answer == "help"
      help()
    elsif answer == "incorect"
      puts "//invalid input//"
    else
      puts answer
    end
  end
  
  def help
    puts
    puts "The functions options are..."
    puts "getData : file, row, column "
    puts "changeData : file, row, column, new Data"
    puts "delete : file, row, column"
    puts "deleteRow : file, row"
    puts "deleteColumn : file, -, column"
    puts
    puts "The catagories are..."
    puts "name, color, level, speed, size, kills"
  end
end