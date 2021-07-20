require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

post('/albums/:id') do
  searchInput = params[:search]
  @albums = Album.all()
  @album = Album.find(params[:search])
  result = @albums.search(searchInput)
  binding.pry
  erb(:albums)
end

# get('/search_results') do
#   @album = Album.find(params[:search])
#   erb(:search_results)
# end


post('/albums') do
  name = params[:album_name]
  artist = params[:album_artist]
  year = params[:album_year]
  genre = params[:album_genre]
  album = Album.new(name, nil, artist, year, genre)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name], params[:artist], params[:year], params[:genre])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end