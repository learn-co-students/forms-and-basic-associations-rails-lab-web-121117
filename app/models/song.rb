class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre = self.genre
    if genre
      self.genre.name
    else
      "No genre"
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist = self.artist
    if artist
      artist.name
    else
      "No artist"
    end
  end

  def note_contents=(contents)
    contents.each do |c|
      note = Note.find_or_create_by(content: c)
      self.notes << note
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end

end
