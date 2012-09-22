require 'rdiscount'

class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :category_list, :content_md, :published, :published_at, :assets_attributes
  belongs_to :user

  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true

  before_create :create_slug
  before_save :create_slug

  before_create :content_markdown_to_html
  before_save :content_markdown_to_html

  before_create :insert_publish_date
  before_save :insert_publish_date

  # Alias for acts_as_taggable_on :tags
  # acts_as_taggable
  acts_as_taggable_on :categories

  validates :title, :presence => true, :uniqueness => true
  validates :content_md, :presence => true

  
  def to_param
    slug
  end

  private
   
    def create_slug
      if self.title
        self.slug = self.title.parameterize
      end
    end

    def content_markdown_to_html
      if self.content_md
        markdown = RDiscount.new(self.content_md)
        self.content = markdown.to_html
      end 
    end

    def insert_publish_date
      if self.published && !self.published_at
        tmp = Post.find_by_id(self.id)
        if !tmp || !tmp.published_at
          self.published_at = DateTime.current
        end
      end 
    end
  
end
