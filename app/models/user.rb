class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :roles, :owned_projects
  has_and_belongs_to_many :roles, :autosave => true
  has_many :owned_projects, :foreign_key=>'owner_id', :class_name=>'Project'

  # attr_accessible :title, :body
  def has_role?(rolename)
    self.roles.exists?(:role=>rolename)
  end
  def roles_for_select
    arr=[]
    self.roles.select('id').all.each do |a|
      arr << a.id
    end
    arr
  end
end
