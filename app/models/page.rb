class Page < ActiveRecord::Base
  has_many :images, as: :imageable, dependend: :destroy
  has_one :cover_image, -> { where imageable_type: 'PageCover' }, class_name: 'Image', foreign_key: :imageable_id, foreign_type: :imageable_type, dependend: :destroy
  has_one :logo_image, -> { where imageable_type: 'PageLogo' }, class_name: 'Image', foreign_key: :imageable_id, foreign_type: :imageable_type, dependend: :destroy


  def cover_image=(image)
    image.imageable_type = 'PageCover'
    super
  end

  def logo_image=(image)
    image.imageable_type = 'PageLogo'
    super
  end
end
