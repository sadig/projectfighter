class Task < ActiveRecord::Base
  attr_accessible :title, :description, :project
  belongs_to :project
end
