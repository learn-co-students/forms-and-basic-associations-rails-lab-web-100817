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

  def notes_1
  end

  def notes_2
  end

  def notes_1=(content)
    self.notes << Note.find_or_create_by(content: content) if content
  end

  def notes_2=(content)
    self.notes << Note.find_or_create_by(content: content) if content
  end

  def notes=(notes)
    notes.each do |note|
      self.notes << Note.find_or_create_by(content: note.content)
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end

  def note_contents=(arr_of_contents)
    arr_of_contents.each do |content|
      self.notes << Note.find_or_create_by(content: content) if content != ""
    end
  end

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

end

