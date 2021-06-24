$LOAD_PATH << '.'

require "mod1"
require "mod2"

Mod1.greeting("Kate")
Mod2.greeting("Kevin")
puts Mod1::NUMBER
puts Mod2::NUMBER
myClass = Mod1::MyClass.new
print myClass.getNum