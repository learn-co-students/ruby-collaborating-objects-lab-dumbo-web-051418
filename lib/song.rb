class Song

  @@all = []
  def self.all
    @@all
  end

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(file_name)
    name_array = self.parse_filename(file_name)
    song = self.new(name_array[1])
    song.artist = Artist.find_or_create_by_name(name_array[0])
    song.artist.add_song(song)
    return song
  end

  def self.parse_filename(file_name)
    file_name_parse = file_name.split(/[-.]/).map {|word| word.strip}
    return file_name_parse
  end


end
