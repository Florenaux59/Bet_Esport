class Game < ApplicationRecord
  def js_slug
    slug.gsub("-", "")
  end
end
