# outputs the vowels in a sting aslong as the string_extentions file is in accesable dir
require './string_extensions'
# this can also be done:
# require_relative 'string_extentions'
# or
# load 'string_extentions.rb'
# you must use .rb for load or it wont be able to find it

Rails.logger.debug 'this is a test'.vowels.join('-')

# if you need to load alot of external files use:
# %w{file1 file2 etc}.each {|file| require file}
