class Survey < ActiveRecord::Base
  has_many(:contents)
end
