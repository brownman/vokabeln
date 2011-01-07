class AddNameToLessons < ActiveRecord::Migration
  def self.up
    add_column :lessons, :name, :string
  end

  def self.down
    remove_column :lessons, :name
  end
end
