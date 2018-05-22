require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(filename)
    @path = filename
  end

  def files
    files ||= Dir.glob("#{self.path}/*.mp3").map {|song| song.gsub("#{self.path}/", "")}
    #binding.pry 
  end

  def import
    self.files.each { |song| Song.new_by_filename(song) }
  end

end
