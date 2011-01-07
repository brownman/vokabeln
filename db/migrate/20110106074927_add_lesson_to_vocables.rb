class AddLessonToVocables < ActiveRecord::Migration
  def self.up
    change_table :vocables do |t|
      t.references :lesson
    end
  end

  def self.down
    change_table :vocables do |t|
      t.remove_references :lesson
    end
  end
end
