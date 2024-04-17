# this shows that after you import it once it will only run once
require_relative 'a'
puts "hello from B"
require_relative 'a'
puts "hello from B again"

# on the other hand...
load 'a.rb'
puts "hello from B3"
load 'a.rb'
puts "hello from B again4"

# this makes load good if you want to immeditly execute code from another file while require is better suited for extending functionality of your main.rb
