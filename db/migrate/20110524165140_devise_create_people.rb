class DeviseCreatePeople < ActiveRecord::Migration
  def self.up
    create_table(:people) do |t|
      t.database_authenticatable :null => false
      #t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
	  
	  t.string     :username
      t.string     :password
      t.string     :domain
      t.integer    :typ
      t.string     :lastName
      t.string     :firstName
      t.boolean    :status
      t.date       :blockedTo
      t.text       :signatur
      t.references :picture
  
	  
      t.timestamps
    end

	add_index :people, :username,             :unique => true
    add_index :people, :email,                :unique => true
    #add_index :people, :confirmation_token,   :unique => true
    add_index :people, :reset_password_token, :unique => true
    # add_index :people, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :people
  end
end
