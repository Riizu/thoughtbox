class Link < ApplicationRecord
  validates :url, url: true, presence: true
  validates :title, presence: true

  belongs_to :user
end
