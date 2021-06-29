class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  # GET /articles or /articles.json
  def index
    # @articles = Article.all
    @articles = Article.includes(:user).limit(3)
    @articles1 = Article.where(part_id:2)
    @article2 = Article.where(part_id:3).pluck(:title, :body, :video)

  end

  # GET /articles/1 or /articles/1.json
  def show
      @articles = Article.includes(:user) 
      # @user = User.find(params[:id])
      @message = Message.new
      @messages = @article.messages.includes(:user).order("created_at DESC")
      @review = Review.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "を投稿しました。"
    else
      render :new
    end
    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to @article, notice: "Article was successfully created." }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    redirect_to root_path
  end

  def category
    @article = Article.find_by(part_id: params[:id])
    @articles = Article.where(part_id: params[:id]).order('created_at DESC')
  end

  def chest
    @chests = Article.where(part_id:1) #ここがポイント！categoryのバリューがdogの投稿を取得！
  end



  private
  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body, :video, :part_id).merge(user_id: current_user.id)
  end
    # # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end


end
