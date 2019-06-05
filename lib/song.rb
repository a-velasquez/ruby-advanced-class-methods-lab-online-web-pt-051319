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
    song = self.new #creates a new instance of Song, sets it to local variable 
    song.save       #calls save method, shovels self into @@all array 
    song            #returns song created in line 14 
  end
  
  def self.new_by_name(name)
    song = self.create      #calls self.create method to handle initialization
    song.name = name        #sets song.name property to name given in argument
    song                    #returns song created
  end 
  
  def self.create_by_name(name)
    song = self.create      #calls self.create method to handle initialization
    song.name = name        #sets song.name property to name given in argument
    song.save               #saves song created using save method 
    song                    #returns song created
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}  #detects if song given in argument is present, returns if true and false 
  end                                       #or nil if not present.
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) #searches @@all using find_by_name method and if it finds it .it returns the value, || (or) if it's false it invokes create_by_name method to create the song 
  end       
                                              
  
  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end

   
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end
  
    def self.create_from_filename(filename)
    new_song = self.new
    new_song.name = filename.split(" - ")[1].split(".")[0]
    new_song.artist_name = filename.split(" - ")[0]
    @@all << new_song
  end
  

  def self.destroy_all()
    @@all.clear
  end
  
  

end
