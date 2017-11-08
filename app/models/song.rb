class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(array)
    array.reject! { |x| x == "" }
    array.each do |note|
      self.notes << Note.find_or_create_by(content: note)
    end
  end

  def note_contents
    self.notes.map {|x| x.content}
  end

end
