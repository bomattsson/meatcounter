class Meal < ActiveRecord::Base
  belongs_to :meats



  def week
    @week = self.created_at.strftime('W')
  end
end
