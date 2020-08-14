class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end
  
  def self.new_by_name(str)
    new_song = Song.new
    new_song.name = str
    new_song
  end
  
  def self.create_by_name(str)
    # new_song = Song.new_by_name(str)
    # new_song.save
    # new_song
    new_song = self.create
    new_song.name = str
    new_song
  end
  
  def self.find_by_name(str)
    self.all.find do |song|
      song.name == str
    end
  end
  
  def self.find_or_create_by_name(str)
    # if find_by_name(str)
    #   find_by_name(str)
    # else
    #   create_by_name(str)
    # end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    data = filename.split(/[-.]/)
    edited_data = data.map {|x| x.strip}
    name = edited_data[1]
    artist_name = edited_data[0]
    new_song = self.create_by_name(name)
    new_song.artist_name = artist_name
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  
      
      
  
  

end
