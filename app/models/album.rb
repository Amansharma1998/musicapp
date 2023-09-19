class Album < ApplicationRecord
  belongs_to :artistid 
  has_many :song, dependent: :destroy

  validates :title , :release_date, presence: true
end
