module Mod1
  NAME = "amanda"
  NUMBER = 42
  class MyClass
    @@x = 12
    # variables = @@ not @
    #https://www.ruby-lang.org/en/documentation/faq/8/
  def getNum
      return @@x
    end
  end
  def Mod1.greeting(name)
    puts NAME + " says hello to " + name
  end
end    