require 'sinatra'

before do
  @people = [
    { name: 'beatrice', age: 20 }, { name: 'gsrgr', age: 2000 }, { name: 'b33333e', age: 40 }
  ]
end

get '/' do
  erb :index
end

__END__

@@ layout
  <html>
  <head>
  <title> My application</title>
  </head>
  <body>
  <h1> My app</h1>
  <% yield %>
  </body>
  </html>
  
  @@ index
    <% @people.each do |peerson| %>
    <p><%= person [:name] %> is <%= person[:age] %> years old </p>
    <% end %>
