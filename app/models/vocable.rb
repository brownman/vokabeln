class Vocable < ActiveRecord::Base
  belongs_to :lesson
  
  validates_presence_of :foreign, :translation
  
  def check_foreign guess
    foreign == guess
  end
  
  def self.search query
    query = "%#{query}%"
    find :all, :conditions => ['`foreign` LIKE ? OR `translation` LIKE ?', query, query]
  end
end
