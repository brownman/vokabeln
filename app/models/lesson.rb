class Lesson < ActiveRecord::Base
  has_many :vocables, :dependent => :destroy
  
  validates :name, :presence => true
  
  def saved_vocables
    vocables.reject do |vocable|
      vocable.new_record?
    end
  end
  
  def random_vocable
    vocables[rand(vocables.size)]
  end
end