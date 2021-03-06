class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def save
    @@all << self
  end
  def self.create(name)
    artist = self.new(name)
    @@all << artist
    artist
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      song.artist = self
    end
  end
  def genres
    @songs.collect {|song| song.genre}.uniq
  end
end