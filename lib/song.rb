class Song
  attr_accessor :name, :artist

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def artist_name(artist_name_string)
    #sets the artist object to belong to the song
    Artist.find_or_create_by_name(artist_name_string)
  end

  def self.new_by_filename(file)

    song_name = file.split(" - ")[1]
    name_of_artist = file.split(" - ")[0]

    song = Song.new(song_name)
    song.artist = song.artist_name(name_of_artist)


    song.artist.add_song(song)
    song

  end
end
