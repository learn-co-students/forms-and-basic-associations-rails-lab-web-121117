class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    if self.genre
      self.genre.name
    else
      ""
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      ""
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    if self.notes
      self.notes.map{|note| note.content}
    else
      ""
    end
  end

  def note_contents=(note_array)
    note_array.each do |note|
      if note.length > 0
        new_note = Note.find_or_create_by(content: note)
        self.notes << new_note
      end
    end

  end


end
