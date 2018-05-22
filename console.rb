require 'pry'

require_relative "./lib/artist.rb"
require_relative "./lib/mp3_importer.rb"
require_relative "./lib/song.rb"

hip_hop = MP3Importer.new("./db/mp3s")

Pry.start
