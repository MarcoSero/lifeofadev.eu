class Asset < ActiveRecord::Base
  attr_accessible :post_id, :image
  belongs_to :post

  has_attached_file :image,
    :styles => {
      :thumb => "50x50#",
      :small => "250x250",
      :medium => "350x350",
      :large => "550x550"
    }
end
