class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def save
    self.class.all << self
  end


  def add_song(song)
    songs << song
  end

  def self.all
    @@all
  end


  def self.new_by_name(name)
    artist = self.new(name)
    artist
  end

  def self.create_by_name(name)
    artist = self.new_by_name(name)
    artist.save
    artist
  end

  def self.find_by_name(name)
    self.all.find { |musician| musician.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)

    else
      self.find_by_name(name)
    end
  end

  def print_songs
    songs.each { |song| puts song.name }
  end


end
