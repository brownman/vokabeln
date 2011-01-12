class Attempt < ActiveRecord::Base
  belongs_to :vocable
  
  validates :date, :presence => true
  validates :success, :inclusion => { :in => [true,false] }
  
  #scope :successful, where(:success => true)
  #scope :unsuccessful, where(:success => false)
  
  default_value_for :date do
    Time.now
  end
end
