class Survey < ActiveRecord::Base
  has_many(:contents)
  before_save :make_title_case

  private

  def make_title_case
    self.title = self.title.titlecase
  end

end
