class Tweet < ActiveRecord::Base
  
  require 'open-uri'

  def self.fetch_tweet(curator)
    tweet = Twitter.user_timeline(curator)
    tweet.each do |t|
      unless self.where(:twit_id => t.id).exists?
        url = URI.extract(t.text, ['http','https'])
        unless url.empty?
          io = open(url.first)
          redirected_url = io.base_uri.to_s
          self.create(:twit_id => t.id, :url => redirected_url, :curator => curator)
        end
      end
    end
  end
  
end
