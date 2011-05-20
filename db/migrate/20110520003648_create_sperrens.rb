class CreateSperrens < ActiveRecord::Migration
  def self.up
    create_table :sperrens do |t|
      t.date :startDate
      t.date :endDate
      t.string :reason

      t.timestamps
    end
  end

  def self.down
    drop_table :sperrens
  end
end
