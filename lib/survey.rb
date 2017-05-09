class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  before_save :make_title_case
  validates(:title, presence: true)

  private

  def make_title_case
    self.title = self.title.titlecase
  end

end
