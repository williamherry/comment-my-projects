class CategoryProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :category

  validates :category, presence: true
  validates :project, presence: true
  validates :description, presence: true

  attr_accessible :description, :category_id, :project_id
end