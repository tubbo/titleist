# typed: strong
class Post < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
end
