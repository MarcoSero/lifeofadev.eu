require 'rdiscount'

class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :category_list, :tag_list
  belongs_to :user

  before_create :create_slug
  before_create :markdown_to_html

  # Alias for acts_as_taggable_on :tags
  acts_as_taggable
  acts_as_taggable_on :categories
  
  def to_param
    slug
  end
    
  def create_slug
    self.slug = self.title.parameterize
  end

  def markdown_to_html
    markdown = RDiscount.new(self.content)
    self.content = markdown.to_html 
  end
  
end
