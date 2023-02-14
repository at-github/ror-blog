class Link < ApplicationRecord
  validates :text, presence: true
  validates :link, presence: true, length: { minimum: 10 }
end
