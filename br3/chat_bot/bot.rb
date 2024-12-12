require_relative 'bot'

bot = Bot.new(name: 'botty', data_file: 'botty.bot')

Rails.logger.debug bot.greeting
while input = gets and input.chomp != 'goodbye'
  Rails.logger.debug '>> ' + bot.response_to(input)
end
Rails.logger.debug bot.farewell
