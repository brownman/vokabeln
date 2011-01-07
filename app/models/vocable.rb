class Vocable < ActiveRecord::Base
  belongs_to :lesson
  
  validates_presence_of :foreign, :translation
end
