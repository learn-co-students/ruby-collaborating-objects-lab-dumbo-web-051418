class Artist
  attr_accessor :name

  @@all = Array.new

  def initialize(name)
    @name = name
    self.save
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each { |song| puts song.name }
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    self.all.select {|artist| artist.name == name}[0] || Artist.new(name)
  end

  def self.all
    @@all
  end

end
