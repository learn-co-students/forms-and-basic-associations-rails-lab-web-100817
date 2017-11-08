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
    # byebug
    self.genre = Genre.find_by(name: name)
  end

  def note_contents
    self.notes.map { |n| n.content }
  end


  def note_contents=(conte)
    # byebug
    conte.each{|c| (self.notes <<  Note.create(content: c)) if c.length > 0}

  end

end
