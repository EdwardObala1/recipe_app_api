require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user){create(:user)}
  let(:recipe){create(:recipe, user: user)}
  let!(:comment){create(:comment, recipe: recipe, user: user)}

  xit 'adds a comment' do
    comment_count = Comment.count
    post post_comment_path, :params => {comment: {id: comment.id, user_id:comment.user, recipe_id: comment.recipe, comment: comment.comment}}
    expect(Comment.count).to eq(comment_count + 1)
  end

  it 'delete a comment' do
    post delete_comment_path, :params => {comment: {id: comment.id}}
    expect(Comment.exists?(id: comment.id)) .to eq(false)
  end

  it 'display all comments related to a specific recipe id' do
    get display_comments_path, :params => {comment: {id: comment.id, recipe_id: comment.recipe}, user: {id: user.id ,name: user.name}}
  end
end
