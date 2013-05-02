class Task < ActiveRecord::Base
  attr_accessible :title, :description, :project, :status, :timerecords
  belongs_to :project
  has_many :time_records

  def all_stopped?
    if self.time_records.where(:started=>true).count > 0
      false
    else
      true
    end
  end

  def total_work_time?
    total_time=0
    self.time_records.where(:started => false).all.each do |t|
      total_time+=TimeDifference.between(t.created_at,t.updated_at).in_seconds
    end

    total_time.round
  end
end
