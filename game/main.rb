$LOAD_PATH << '.'
require 'app'
app = App.new

=begin
def amanda()
  puts "gg"
  yield 5
  puts "42"
  yield 200
end

amanda { |i| 
  puts "this is i = #{i}"
}

def test(n, &block)
  puts n
  block.call
end 

test(5) {
  puts"hello"
}
=end