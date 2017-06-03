class Genre
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
    genre = self.new(name)
    @@all << genre
    genre
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
      song.genre = self
    end
  end
  def artists
    @songs.collect{|song| song.artist}.uniq
  end
end