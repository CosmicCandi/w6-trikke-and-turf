class Post < ApplicationRecord
  belongs_to :user

  validates :body, :title, :user, presence: true

end
