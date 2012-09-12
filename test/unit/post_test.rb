require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Post must have both markdown and html content" do
    post = Post.new(:title => "Ciao",
                    :content_md => "Hi there",
                    :published => false)
    assert post.save
    assert post.content
  end

  test "Post must slug" do
    post = Post.new(:title => "Ciao",
                    :content_md => "Hi there",
                    :published => false)
    assert post.save
    assert_equal post.slug, post.title.parameterize
  end
end
