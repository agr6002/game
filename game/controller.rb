class Controller
  def initialize(app)
    #puts "  initializing controller"
    @app = app
  end

  def run
    puts 
    puts "function playerNumber catagory fill" 
    STDOUT.flush
    @info = gets.chomp.split(" ")
    return @info
  end
end