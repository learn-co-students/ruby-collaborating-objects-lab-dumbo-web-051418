require 'pry'
class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)

    self.all.each do |artist|
      #binding.pry
      if artist.name == name
        return artist
      end
    end
    #binding.pry
    Artist.new(name)

    # if self.all.select {|artist| artist.name == name} != []
    #   self.all.select {|artist| artist.name == name}
    # else
    #   Artist.new(name)
    #   binding.pry
    # end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
