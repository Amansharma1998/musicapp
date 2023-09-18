class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album, optional:true

  validates :title, :genre, presence: true
  validates :playcount, numericality:{greater_orequal_to: 0}
end
