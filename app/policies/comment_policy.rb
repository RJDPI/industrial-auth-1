class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    photo = Photo.find(comment.photo_id)
    user == photo.owner || !photo.owner.private? || user.leaders.include?(photo.owner)
  end

  def edit?
    user == comment.author
  end

  def update?
    user == comment.author
  end

  def destroy?
    user == comment.author
  end



end
