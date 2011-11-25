class HomeController < ApplicationController
  def index
    @news = News.where('votes > 1').order('votes desc')
    @tweets = Tweet.all
  end

end
