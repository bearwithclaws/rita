# Rita

Rita fetches URLs from tweets of influencers* and rank them by the number of times they are tweeted. The first version was created within couple of hours in Foward S/ash Hackathon.

## Version 0.1
![version 0.1 screenshot](https://github.com/bearwithclaws/rita/raw/master/public/rita-screenshot.png)

There's no backend in this version. All data are fetched from the console:

    $ rails console

This fetches all the recent tweets which contains URLs from @bearwithclaws
    
    > Tweet.fetch_tweet("bearwithclaws")

Or better, you can fetch tweets from Twitter list.
    
    > Tweet.fetch_tweet_from_list("webolutions", "influential-hubs")

And then, you'll have to run this to 'translate' the tweets into News item (with votes, title etc)
    
    > News.get_news
    
Done! Run the app to see it.
    
    $ rails server
    
## Upcoming Version

 - categorization
 - production server deployment 
 - admin area (active admin)
 - live update news (cron, socket io, juggernaut)
 - display who tweeted the news