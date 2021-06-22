class Song
  
  # When we give a setter and a getter method to the class Ssing fo Artist that is how we
  # develop a "belongs to" relationship 
  
    attr_accessor :title, :artist, :genre
    
    @@all = []
    
    def initialize(title, genre)
      @title = title
      @genre = genre
      save
    end
    
    # Although with the implementation of add_song method in Artist Class we are maintaining the realtionship on Song instance and Artist instance, now the artist knows which songs it has and the song knows the artist it belongs to. However to keep this information maintained on both sides of the relationship means there are two sources of truth. We can not use the add_sond method and still be able to do the following
    
    # hotline_bling = Song.new("hotline Bling", "Rap")
    # drake = Artist.new("Drak")
    
    # hotline_bling.artist = drake
    # hotline_bling.artist.name #=> drake
    
    # # Not do drake.add_song(hotline_bling)
    
    # And when we ask drake.songs we get an empty array #=> []
    
    # Not the Song instance "hotline_bling" is associated with an artist "drake", but drake does not know about "hotline_bling" still. We have multiple sources of truth about artist and thier songs and they are not aligned. 
    
    # To best way is to maintain "has-many" / "belong-to" relationship on only one side of the realtionship and this can be achieved with the implementation of collection of all song instance ever created by all artist we could just query that list by asking for all songs that belong to a given artist rather than have each artist keep track of their own songs. 
    # We now create @@all and its related methods. We set up a class variable, @@all, set to an empty Array, and a getter method, .all. This way, when a song is initialized, we can push the instance into the @@all and be able to use Song.all to retrieve all Song instances:
    
    def save 
      @@all << self
    end
    
    def self.all
      @@all
    end
    
    # With this implementation, we're able to achieve a "has-many" / "belongs-to" relationship while maintaining a single source of truth! We also modify our #songs and #add_song in our Artist class
   
   
   # Furthermore rather than asking for artist's name of a song by linking the methods in this way --"hotline_bling.artist.name"-- we can simply create a method 
   
   def artist_name
     self.artist.name
  end
  
  # And now we can simply ask "hotline_bling.artist_name"
  
  #Collaborating with MP3 Importer
  
  # Ther can be 2 versions of the #new_by_filename
  
  # When song instance needs to be initialized with a title and genre
  def self.new_by_filename(filename)
    
    song.title = filename.spli(" - ")[1]
    song.genre = filename.split(" - ")[2] 
    
    song = self.new(title, genre) 
    
    song
  end 
  
  # When song instance does not need to be initialized with any arguments but has attr_accessor for title and genre
  def self.new_by_filename(filename)
    song = self.new
    song.title = filename.spli(" - ")[1]
    song.genre = filename.split(" - ")[2]
    
    song
  end
  
  #Also look at the change in #artist_name from the one above
  
  
  
end

hotline_bling = Song.new("Hotline Bling", "Hip Hop")

hotline_bling.title #=> "Hotline Bling"

hotline_bling.artist= "Drake"

hotline_bling.artist #=> "Drake"

# After implementation of @@all and related methods. 
hotline_bling = Song.new("Hotline Bling", "Hip Hop")
drake = Artist.new("Drake")

hotline_bling.artist = drake
# Now we can ask
Song.all.first.name #=> "Hotline Bling"
Song.all.first.genre #=> "Hip Hop"
Song.all.first.artist.name #=> "Drake"
Song.all.first.artist #=> <We get the drake Artist object with it's object_id and @songs =[] >




