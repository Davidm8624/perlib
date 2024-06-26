text = ''
line_count = 0
File.open('text.txt').each do |line|
  line_count += 1
  text += line
end

puts "#{line_count} lines"

total_characters = text.length
puts "#{total_characters} char"

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} char without spaces"

word_count = text.split.length
puts "#{word_count} words"

paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"

sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"

puts "#{sentence_count / paragraph_count} sentences per paragraph avg"
puts "#{word_count / sentence_count} words per sentence avg"
