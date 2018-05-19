require 'pry'

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).select {|file| file[file.length-4..file.length-1] == ".mp3"}
  end

  def import
    self.files.each { |filename| Song.new_by_filename(filename) }
  end

end
