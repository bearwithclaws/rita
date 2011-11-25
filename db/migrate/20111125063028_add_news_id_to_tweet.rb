class AddNewsIdToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :news_id, :integer
  end
end
