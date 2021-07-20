require 'pry'

class Album
  attr_accessor :id, :name, :artist, :year, :genre

  @@albums = {}
  @@total_rows = 0

  def initialize(name, id, artist, year, genre)
    @name = name
    @id = id || @@total_rows += 1
    @artist = artist
    @year = year
    @genre = genre
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.year, self.genre)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name, artist, year, genre)
    @name=name
    @artist=artist
    @year=year
    @genre=genre
  end

  def delete
    @@albums.delete(self.id)
  end

  def self.search(name)
    @@albums.select(name)
  end
end
