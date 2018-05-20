class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
    name = filename.split(" - ")[1]
    song = Song.new(name)
    artist_name = filename.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
    song
  end

  def self.all
    @@all
  end
end
