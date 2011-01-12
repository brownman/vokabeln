class Vocable < ActiveRecord::Base
  belongs_to :lesson
  has_many :attempts
  
  validates_presence_of :foreign, :translation
  
  def check_foreign guess
    create_attempt(foreign == guess)
  end
  
  def self.search query
    query = "%#{query}%"
    find :all, :conditions => ['`foreign` LIKE ? OR `translation` LIKE ?', query, query]
  end
  
  private
  
  def create_attempt success
    attempts.create :success => success
    success
  end
end
