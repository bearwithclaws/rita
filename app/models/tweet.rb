class Tweet < ActiveRecord::Base
  
  def self.fetch_tweet(curator)
    tweet = Twitter.user_timeline(curator)
    tweet.each do |t|
      self.create(:twit_id => t.id, 
                  :url => t.urls.first, 
                  :curator => curator) unless self.where(:twit_id => t.id).exists? || t.urls.empty?
    end
  end
  
  def self.fetch_tweet_from_list(list_owner, list_name)
    members = Twitter.list_members(list_owner, list_name)
    members.collection.each do |m|
      self.fetch_tweet(m.screen_name) unless Twitter.user(m.screen_name).protected?
    end
  end
  
end
