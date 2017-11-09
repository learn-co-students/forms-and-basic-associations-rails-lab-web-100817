class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def note_contents=(note_contents)
    note_contents.each do |note_content|
      if !note_content.blank?
        note = Note.find_or_create_by(content: note_content)
        self.notes<<note
      end
    end
  end

end
