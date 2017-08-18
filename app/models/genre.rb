class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    self.songs.count("artist_id", :distinct => true)
  end

  def all_artist_names
    Artist.pluck(:name)
  end
end
