class Song
    attr_accessor :name, :artist

    @@all = []
    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def artist_name=(name) 
        new_artist = Artist.find_or_create_by_name(name)
        new_artist.add_song(self)
    end

    def self.new_by_filename(filename)
        split_filename = filename.split(" - ")
        artist_name = split_filename[0]
        song_name = split_filename[1]#.slice(0...-4)
        song = Song.new(song_name)
        song.artist_name = artist_name
        song
    end
    
end