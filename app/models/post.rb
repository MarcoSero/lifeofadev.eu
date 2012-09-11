require 'rdiscount'

class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :category_list, :content_md, :draft
  belongs_to :user

  before_create :create_slug
  before_save :create_slug

  before_create :content_markdown_to_html
  before_save :content_markdown_to_html

  # Alias for acts_as_taggable_on :tags
  # acts_as_taggable
  acts_as_taggable_on :categories
  
  def to_param
      slug
    end

  private
   
    def create_slug
      self.slug = self.title.parameterize
    end

    def content_markdown_to_html
      markdown = RDiscount.new(self.content_md)
      self.content = markdown.to_html 
    end
  
end
