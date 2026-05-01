class Comic < ApplicationRecord
  validates :name, :issue, :publishData, :pageNumber, :imageUrl, presence: true

  belongs_to :franchise
end
