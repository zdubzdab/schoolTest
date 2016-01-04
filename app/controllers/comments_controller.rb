class CommentsController < ApplicationController

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: t('.controllers.sucessful') }
      else
        format.html { render action: 'new' }
      end
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :text, :user_id)
    end
end
