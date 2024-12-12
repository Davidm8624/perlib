text = ''
line_count = 0
File.open('text.txt').each do |line|
  line_count += 1
  text += line
end

Rails.logger.debug { "#{line_count} lines" }

total_characters = text.length
Rails.logger.debug { "#{total_characters} char" }

total_characters_nospaces = text.gsub(/\s+/, '').length
Rails.logger.debug { "#{total_characters_nospaces} char without spaces" }

word_count = text.split.length
Rails.logger.debug { "#{word_count} words" }

paragraph_count = text.split("\n\n").length
Rails.logger.debug { "#{paragraph_count} paragraphs" }

sentence_count = text.split(/\.|\?|!/).length
Rails.logger.debug { "#{sentence_count} sentences" }

Rails.logger.debug { "#{sentence_count / paragraph_count} sentences per paragraph avg" }
Rails.logger.debug { "#{word_count / sentence_count} words per sentence avg" }
