class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  enum :article_types, { Article: 0, Suggestion: 1 }
end
