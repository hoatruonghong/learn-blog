class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  expose(:posts){Post.all.order("updated_at DESC")}
  expose(:post)

  #each user has many posts, path: user/:user_id/posts/...
  def index
    puts params
    query = ""    
    if params[:author]
      query += "author LIKE '%" + params[:author] + "%'"
    end
    if params[:keyword]
      if query.length != 0
        query += " and "
      end
      query += "content LIKE '%" + params[:keyword] + "%'"
    end     # can I use map ?
    puts "queryyyy" ,query
    posts = Post.where(query).paginate(page: params[:page], per_page: params[:limit])

    render json: posts
  end

  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    # @post = Post.new(post_params)
    # puts @post
    # puts params
    puts("post  ", post.content)

    # debugger

    respond_to do |format|
      if post.save
        format.json { render json: post, status: :created }
      else
        format.json { render json: post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.json { render :show, status: :ok, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.json { head :no_content , result: "delete successfully"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:author, :content, :likes)
    end
end
