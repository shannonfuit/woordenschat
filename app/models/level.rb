# group of questions
class Level < ActiveRecord::Base
  has_many :questions
  has_many :played_levels
end
