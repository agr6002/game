require "model"
require "view"
require "controller"

class App
  def initialize()
    #puts "initializing app"
    @model = Model.new(self)
    @view = View.new(self)
    @controller = Controller.new(self)
    @running = true
    self.run()
  end
  def run()
    #puts "running app"
    while @running == true
      @view.run(@model.run(@controller.run()))
    end
  end
  def test(n)
    puts n
  end
  def getModel()
    return @model
  end
end