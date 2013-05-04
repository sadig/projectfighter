class Project < ActiveRecord::Base
  attr_accessible :slug, :title, :description, :owner, :tasks
  belongs_to :owner, :class_name=>'User'
  has_many :tasks

  def no_of_tasks?(status)
    self.tasks.where(:status => status).count
  end
end
