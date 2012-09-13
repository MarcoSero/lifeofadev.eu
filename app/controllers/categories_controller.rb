class CategoriesController < ApplicationController

  skip_before_filter :authorize, :only => [:index, :show]

  # GET /posts
  # GET /posts.json
  def index  
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { render json: '' }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = params[:id]
    @posts = Post.tagged_with(params[:id]).order("created_at DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @posts }
    end
  end

end
