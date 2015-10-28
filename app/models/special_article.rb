class SpecialArticle < Article
  has_one :image, as: :imageable, dependend: :destroy
end
