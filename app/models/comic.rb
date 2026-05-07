class Comic < ApplicationRecord
  validates :name, :issue, :publishData, :pageNumber, :imageUrl, presence: true

  belongs_to :franchise


  scope :search, ->(query) {
    wildcard_query = "%#{query}%"
    
    joins(:franchise).where(
      "comics.name ILIKE :q OR 
      franchises.name ILIKE :q OR 
      CAST(comics.issue AS TEXT) ILIKE :q OR 
      CAST(comics.\"publishData\" AS TEXT) ILIKE :q OR 
      CAST(comics.\"pageNumber\" AS TEXT) ILIKE :q",
      q: wildcard_query
    )
  }
end
