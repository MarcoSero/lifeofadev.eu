class PostsController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :show, :feed]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(:published => true).order("published_at DESC").paginate(:page => params[:page], :order=>'created_at desc',
      :per_page => 5)

    if request.xhr?
      sleep(2) # UX tip: make request a little bit slower to see loader :-)
      render :partial => @posts
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @posts }
      end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by_slug!(params[:id])

    # not show drafts to visitors
    if !@post.published && !session[:user_id]
      not_found
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find_by_slug!(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to edit_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render json: edit_post_path(@post), status: :created, location: @post }
        format.js   { render :nothing => true }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    #@post = Post.find(params[:id])
    @post = Post.find_by_slug!(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to edit_post_url(@post), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
        format.js   { render :nothing => true }
      else
        format.html { render action: "edit" }
        format.json { render json: edit_post_url(@post).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    #@post = Post.find(params[:id])
    @post = Post.find_by_slug!(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def feed
    # this will be the name of the feed displayed on the feed reader
    @title = "Life of a Dev"

    # the news items
    @posts = Post.find_all_by_published(true)
    if @posts
      @posts = @posts.sort_by(&:published_at).reverse!
    end

    # this will be our Feed's update timestamp
    @updated = @posts.first.published_at unless @posts.empty?

    respond_to do |format|
      format.atom { render :layout => false }

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end
