class Tweet < ActiveRecord::Base
  
  def self.fetch_tweet(curator)
    tweet = Twitter.user_timeline(curator)
    agent = Mechanize.new
    tweet.each do |t|
      unless self.where(:twit_id => t.id).exists?
        unless t.urls.empty?
          begin
            redirected_url = agent.get(t.urls.first).uri.to_s
            self.create(:twit_id => t.id, :url => redirected_url, :curator => curator)
          rescue Mechanize::ResponseCodeError
            puts $!.response_code
          end
        end
      end
    end
  end
  
  def self.fetch_tweet_from_list(list_owner, list_name)
    members = Twitter.list_members(list_owner, list_name)
    members.collection.each do |m|
      self.fetch_tweet(m.screen_name) unless Twitter.user(m.screen_name).protected?
    end
  end
  
end
