class Artist
  
  attr_accessor :name
  
  
  
  def initialize(name, genre)
    @name = name
    # @genre = genre
    @songs = [] 
  end
  
  def add_songs(song)
    @songs << song
    # Once we have associated the Song instance with Artist instance in the Add_song method we have only fulfilled one side of the relationship that is telling the Artist class that it has this particular song in it collection and how to add it to the collection @songs, but we forgot to tell the Song instance that it belong to this particular artist and therefor we need to add then folowing line of code
    
    song.artist = self
    # We are using the attr_accessor :artist in the Song Class here.
  end
  
  
   #After the implementation of @@all in the Song Class 
    
  # Now that we've got a way to get all songs, if we want to find all the songs that belong to a particular artist, we can just select the appropriate songs:
    
    def songs
      Song.all.select {|song| song.artist == self}
    end
  
  # def songs  -- --- and get rid of this one --- --
  #   @songs
  # end
  
  # if we can just get the necessary information selecting from Song.all, we no longer need the @songs instance variable in our Artist class.
  
  # And this would also modify our add_song method from the one above to simply 
  
  def add_song(song)
    song.artist = self
  end  
  
  # With this implementation, we're able to achieve a "has-many" / "belongs-to" relationship while maintaining a single source of truth!
  
  #Furthermore as it currently stands that we have to first create a song instance and then add it to Artist's collection of songs.. We can simply combine both these steps by adding one more method and that is 
  
  def add_song_by_name(name, genre)
    song = Song.new(name, genre)
    add_song(song)
  end
end


drake = Artist.new("Drake", "Hip Hop")

hotline_bling = Song.new("Hotline Bling")

#This is where we build the association of the Song Instance with Artist Instance

#We enact this relationship by giving songs a setter and a getter method for their artist. 
hotline_bling.artist = drake 

hotline_bling.artist.name #=> "Drake"

hotline_bling.artist.genre #=> "Hip Hop"

# By adding the string "Hotline Bling" in the add song method we are limiting our Artist object that is drake to prsent certain information when asked for. 
drake.add_song("Hotline Bling") 

# So the best way to associate Artist instance and Song instance so that we establish a "Has many relationship" we should .....

drake.add_song(hotline_bling)

# add the instance of the Song class to the add_song instance method for Artist

# and now we will have

drake.songs  # =>[#<Song:0x007fa96a878348, #<Song:0x007fa96a122580 @name="Hotline Bling", @genre="Hip Hop">]


after adding the song.artist = self in the add_song method we can

hotline_bling.artist.name #=> "Drake"