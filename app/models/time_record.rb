class TimeRecord < ActiveRecord::Base
  attr_accessible :task, :created_at, :updated_at, :started, :first, :last
  belongs_to :task
end
