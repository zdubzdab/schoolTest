class Admin::CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.order("created_at DESC").page(params[:page]).per(Comment::ADMIN_COMMENTS_INDEX_PAGES)
    respond_to do |format|
      format.html { render partial: "comments" if request.xhr? }
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    respond_to do |format|
      if @comment.destroy
        format.js { render nothing: true }
      else
        format.html { redirect_to admin_comments_path, notice: t('.controllers.error') }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :text, :user_id)
    end
end
