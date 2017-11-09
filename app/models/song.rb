class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name #getter
    if self.artist
      self.artist.name
    end
  end

  # def note_contents=(notes)
  #   notes.each do |note|
  #     if note.strip != ""
  #     # note = Note.create(content: content, song: self)
  #     # self.notes << note
  #       self.notes.build(content: note)
  #     end
  #   end
  # end
  #
  # def note_contents
  #  self.notes.map(&:content)
  # end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end

  def genre_name=(name)
    genre = Genre.find_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.name
  end

end
