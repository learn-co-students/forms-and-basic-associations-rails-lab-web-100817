class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def genre_name=(name)
    genre = Genre.find_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(notes)
    notes.each do |note|
      if note.strip != ""
        #Note.create(content: note, song: self)
        self.notes.build(content: note)
          #self.notes == all the notes that belong to this song
          #build into self.notes a new note
            #build also checks if that note already exists in the db
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end



end
