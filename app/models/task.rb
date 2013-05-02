class Task < ActiveRecord::Base
  attr_accessible :title, :description, :project, :status
  belongs_to :project
end
