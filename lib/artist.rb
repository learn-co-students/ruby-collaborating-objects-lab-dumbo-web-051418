require 'pry'
class Artist
  attr_accessor :name, :artist, :songs
  @@all = []
  def initialize name
    @name = name
    self.save
    @songs = []
  end
  def self.all
    @@all
  end
  def save
    @@all << self
  end
  def self.find_or_create_by_name artist_name
    if self.all.find {|artist| artist.name == artist_name}
    else
      Artist.new(artist_name)
    end
  end
  def add_song song
    @songs << song
  end
  def print_songs
    songs.each do |song|
      puts song.name
    end
  end


end
