class CommentsController < ApplicationController

  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @post.comments.create(comment_params)
      redirect_to @post,
                  notice: 'Comment was successfully added.'

    else
      redirect_to @post,
                  alert: 'Error creating comment.' + 
                  @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    @comment.destroy

    redirect_to @post, notice: 'your comment was successfully deleted!'
  end
    

  private 

    def comment_params
      params.require(:comment).permit(:author, :body, :emails)
    end
end