class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :curator
      t.string :url
      t.integer :twit_id
      t.timestamps
    end
  end
end
