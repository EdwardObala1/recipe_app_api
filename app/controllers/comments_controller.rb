class CommentsController < ApplicationController

  def add
    if request.post?
      new_comment = Comment.create(comment_params)
    #   puts new_comment.comment
    end
  end

  def delete
    if request.post?
      comment = Comment.find_by(id: comment_params[:id])
      comment.destroy
    end
  end

  def display
    Comment.all.each do |comment|
      user = User.find_by(id: comment.id)
      user.name
      comment.comment
    end
  end

  def comment_params
    params.permit(:id, :user_id, :recipe_id, :comment, :name)
  end

end
