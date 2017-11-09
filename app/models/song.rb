class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  def artist_name
    # byebug
    if self.artist
      self.artist.name
    end
  end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  def genre_name
    if self.genre
      self.genre.name
    end
  end
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  def note_contents=(notes)
    # byebug
    notes.reject!{|x| x == ""}
    notes.each do |note|
      note = Note.find_or_create_by(content: note)
      self.notes << note
    end
  end
  def note_contents
    if self.notes
      self.notes.map do |note|
        note.content
      end
    end
  end
end
