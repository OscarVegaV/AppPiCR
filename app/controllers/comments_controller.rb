class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]
  before_action :set_comment, only: %i[ show edit update destroy ]
  
  # GET /comments or /comment.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new    
    @comment = comment_to
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = comment_to
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: "El comentario se creó correctamente." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "El comentario se actualizó correctamente." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "el comentario se destruyó con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :commentable_id, :commentable_type, :content)
    end
    
    def comment_to
      if params[:place_id]
        @place = Place.find(params[:place_id])
        params[:comment] ? @place.comments.build(comment_params) : @place.comments.build    #retorna commentario
      elsif params[:picture_id]
        @picture = Picture.find(params[:picture_id])
        params[:comment] ? @picture.comments.build(comment_params) : @picture.comments.build #retorna commentario
      else
        params[:comment] ? current_user.comments.build(comment_params) : current_user.comments.build   #retorna commentario
      end
    end

end
