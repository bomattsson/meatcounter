class Meat < ActiveRecord::Base
  has_many :counts
  validates :name, uniqueness: {message: "Name already exists"}
  belongs_to :user
  is_impressionable

end
