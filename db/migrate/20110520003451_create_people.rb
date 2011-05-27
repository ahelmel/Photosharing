class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :domain
      t.integer :typ
      t.string :lastName
      t.string :firstName
      t.boolean :status
      t.date :blockedTo
      t.text :signatur
      t.references :picture

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
