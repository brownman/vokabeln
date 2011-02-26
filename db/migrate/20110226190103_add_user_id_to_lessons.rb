class AddUserIdToLessons < ActiveRecord::Migration
  def self.up
    first_user = User.create({
      :username => "tim",
      :email    => "tim@timbaumann.info",
      :password => "changethis",
      :password_confirmation => "changethis"
    })
    
    add_column :lessons, :user_id, :integer
    
    Lesson.all.each do |lesson|
      lesson.user = first_user
      lesson.save
    end
  end

  def self.down
    remove_column :lessons, :user_id
  end
end
