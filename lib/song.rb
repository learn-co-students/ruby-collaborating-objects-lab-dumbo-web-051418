require 'pry'
class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize name
    @name = name
    @@all << self
  end

  def add_song_by_artist artist_name, song
    Artist.all.each do |artist|
      if artist == artist_name
        artist.songs << song
      end
    end
  end

  def self.new_by_filename file
    song_array = file.split(" - ")
    new_song = Song.new(song_array[1])
    new_song_artist = Artist.find_or_create_by_name(song_array[0])
    new_song.artist = new_song_artist #needed to add the artist instance 'value' instead of the string value of the artist name
    # binding.pry
    # new_song.artist.add_song(new_song)
    new_song.add_song_by_artist(new_song_artist, new_song)
    new_song
  end

  def self.all
    @@all
  end
end
