require 'sinatra'

get '/' do
  erb :index
end

post '/secretdata' do
  halt 403 if params[:password] != 'pass'
  erb :secretdata
end

not_found do
  '<html><body>Sorry your lost</body></html>'
end

__END__
 
@@ index
  <form method="POST" action="/secretdata">
  Password: <input type="text" name="password" />
  <input type="submit" value="authorize" />
  </form>

@@ secretdata
  here's out secret data <code> efnorihgfi4 </code>
