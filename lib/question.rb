class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:results)
end
