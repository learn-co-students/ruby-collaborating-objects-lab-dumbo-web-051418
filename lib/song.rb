class Song
  attr_accessor :name, :artist

  @@all = Array.new

  def initialize(name)
    @name = name
    @artist = artist
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    song_info = filename.split(" - ")
    # song_info contains [0] - the artist, [1] - the title, [2] - genre .mp3
    song = Song.new(song_info[1])
    song.artist = Artist.find_or_create_by_name(song_info[0])
    song
  end
end
