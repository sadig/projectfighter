class Role < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :role, :description, :users
  has_and_belongs_to_many :users
end
