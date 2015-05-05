class CommentsController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    @user = current_user

    @comment = @user.comments.create(comment_params)
    #binding.pry
    redirect_to entry_path(@entry)
  end
  
  def destroy
    #binding.pry
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to @comment.entry
    #redirect_to request.referrer
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content, :entry_id)
      #binding.pry
    end
end
