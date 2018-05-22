class Song
  attr_accessor :name, :artist

 @@all = []

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    file_array = self.parse_name(filename)

    song = self.new(file_array[1])
    song.artist = Artist.find_or_create_by_name(file_array[0])

    song.artist.add_song(song)
    song 
  end

  def self.parse_name(filename)
    filename.split(/[-.]/).map {|word| word.strip}
  end

end
