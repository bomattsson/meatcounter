class Meat < ActiveRecord::Base

  validates :name, uniqueness: {message: "Name already exists"}
  belongs_to :user
  has_many :meals
  is_impressionable

end
