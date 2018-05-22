class Artist

  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    self.songs << song
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

  def self.find_by_name(name)
    self.all.find {|artist| artist.name == name}
  end

  def self.new_by_name(name)
    artist = self.new(name)
    return artist
  end


  def self.create_by_name(name)
      artist = self.new_by_name(name)
      artist.save
      return artist
  end

  def self.find_or_create_by_name(artist_name)
    if self.find_by_name(artist_name) == nil
      artist = self.create_by_name(artist_name)
      return artist
    else
      self.find_by_name(artist_name)
    end
  end

end
