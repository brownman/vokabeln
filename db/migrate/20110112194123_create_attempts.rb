class CreateAttempts < ActiveRecord::Migration
  def self.up
    create_table :attempts do |t|
      t.references :vocable
      t.datetime :date
      t.boolean :success
    end
  end

  def self.down
    drop_table :attempts
  end
end
