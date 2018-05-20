class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist = self.find_by_name(name)
    if !artist
      artist = Artist.new(name)
      artist.save
    end
    artist
  end

  def self.find_by_name(name)
    self.all.find {|artist| artist.name == name }
  end

  def print_songs
    songs = Song.all.select {|song| song.artist == self }
    songs.each do|song|
      puts song.name
    end
  end

  def save
    self.class.all << self
  end
end
