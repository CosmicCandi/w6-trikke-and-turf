class Post < ApplicationRecord
  belongs_to :user

  validates :body, :title, :user, presence: true

  def is_owner?(this_user)
    user == this_user
  end

end
