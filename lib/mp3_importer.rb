require 'pry'
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path)
    files = files[2...files.length]
    #binding.pry
  end

  def import
    self.files.each do |song_filename|
      Song.new_by_filename(song_filename)
      #binding.pry
    end
  end

end
