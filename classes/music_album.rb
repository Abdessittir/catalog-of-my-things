require_relative './item'

class MusicAlbum < Item
  def initialize(publish_date, on_spotify)
    @on_spotify = on_spotify
    super(publish_date)
  end

  def to_hash
    {
      'id' => @id,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date,
      'genre' => @genre&.name,
      'label' => @label&.to_hash,
      'sourse' => @sourse&.to_hash,
      'author' => @author&.to_hash,
      'class' => self.class.name
    }
  end

  private

  def can_be_archived?
    super() && @on_spotify
  end
end
