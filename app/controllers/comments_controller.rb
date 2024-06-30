class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@post), notice: "Your reply was successfully posted." }
        format.json { render :show, status: :created, location: @post }
      else
        @comments = @post.comments.order(created_at: :desc)
        format.html { render "posts/show", status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
