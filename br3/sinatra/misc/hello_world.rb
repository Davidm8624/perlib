require 'sinatra'

# get '/' do
# "hello, world"
# end

get '/bye' do
  'leaving already?'
end

get '/time' do
  Time.now.to_s
end

get '/add/:a/:b' do |a, b|
  (a.to_i + b.to_i).to_s
end

# these 2 work together to take input then display that output after submission
# get '/' do
# '<form method = "post">
# Enter your name: <input type="text" name="name" />
# <input type="submit" value="go!" />
# </form>'
# end

# post '/' do
# "Hello #{params[:name]}!"
# end

# ___________________________________________________________________________________________________
# this is called an inline template
# before do #stuff here done before any request go anywhere, it dont matter where in the file this is located
# @people = [
# {name: "bob", age: 55},{name: "bobby", age: 555},{name: "bobble", age: 5},
# ]
# end

# get '/' do
# erb %{
# <% @people.each do |person| %>
# <p><%= person [:name] %> is <%= person[:age] %> years old </p>
# <% end %>
# }
# end

# ________________________________________________________________
# alternative way to do the above

get '/' do
  erb :index
end

# anything after the end blok wont be displayed but can still be accessed by anything above
__END__

@@ index
    <% @people.each do |person| %>
    <p><%= person [:name] %> is <%= person[:age] %> years old </p>
    <% end %>
