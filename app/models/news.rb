class News < ActiveRecord::Base
  def self.get_news
    tweets = Tweet.where(:news_id => nil) # get all tweets which haven't assigned url yet
    agent = Mechanize.new
    tweets.each do |t|
      begin
        page = agent.get(t.url)
        unless page.class == Mechanize::File
          redirected_url = page.uri.to_s
          existing_news = self.where(:url => redirected_url).first
          if existing_news
            vote_count = existing_news[:votes] + 1
            existing_news.update_attributes(:votes => vote_count)
          else
            self.create(:url => redirected_url, :votes => 1, :title => page.title.to_s)
          end
          t.update_attributes(:news_id => self.id)
        end
      rescue Mechanize::ResponseCodeError
        puts $!.response_code
      end
    end
  end
end