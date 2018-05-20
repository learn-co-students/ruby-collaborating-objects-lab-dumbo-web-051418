require 'pry'

class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(self.path).reject {|file| [".", ".."].include? file}
  end

  def import
    for file in files
      song = Song.new_by_filename(file)
      # binding.pry
    end
  end
end
