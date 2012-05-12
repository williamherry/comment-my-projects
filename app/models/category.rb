class Category < ActiveRecord::Base
  has_many :projects, through: :category_projects
  has_many :category_projects

  attr_accessible :label
end
