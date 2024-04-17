require 'csv'

people = CSV.read('text.csv')
laura = people.find { |person| person[0] =~ /Laura/ }
laura[0] = "Lauren Smith"

CSV.open('text.csv', "w") do |csv|
  people.each do |person|
    csv << person
  end
end

CSV.open('text.csv').each do |person|
  p person
end

#edits info in .csv
