class Role < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :role, :description
  has_and_belongs_to_many :users, :autosave => true
end
