class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  belongs_to :user

  before_create :create_slug
  
  def to_param
    slug
  end
    
  def create_slug
    self.slug = self.title.parameterize
  end
  
end
