class Note < ActiveRecord::Base
  belongs_to :song

  def notes_content
    self.content
  end
end
