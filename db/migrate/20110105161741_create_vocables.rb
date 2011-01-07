class CreateVocables < ActiveRecord::Migration
  def self.up
    create_table :vocables do |t|
      t.string :foreign
      t.string :translation
      t.timestamps
    end
  end

  def self.down
    drop_table :vocables
  end
end
