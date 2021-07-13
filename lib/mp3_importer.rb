class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
    end
    def files
        Dir.glob("#{@path}/*").map do |file| 
            #file = file.slice(0...-4)
            file = file.slice(@path.length+1,file.length)
        end
    end

    def import 
        self.files.each {|file| Song.new_by_filename(file)}
    end
end