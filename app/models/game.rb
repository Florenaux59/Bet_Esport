class Game < ApplicationRecord
  def js_slug
    slug.gsub("-", "")
  end
  has_many :matches
end
