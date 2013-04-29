class Project < ActiveRecord::Base
  attr_accessible :slug, :title, :description, :owner
  belongs_to :owner, :class_name=>'User'
end
