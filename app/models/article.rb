class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3,
                                              too_long: "%{count} characters is the maximum allowed" }
  validates :description, presence: true, length: { minimum: 3,
                                                    too_long: "%{count} characters is the maximum allowed" }

  paginates_per 5
end
