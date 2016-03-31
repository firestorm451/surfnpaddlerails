class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, :body, :author, presence: true

end
