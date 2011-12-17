require 'daylife'
require 'open-uri'
require 'iconv'

desc "Build feeds for users"
task :build_feed => :environment do
  raw_config = File.read(Rails.root + "config/daylife.yaml")
  daylife_config = YAML.load(raw_config)[Rails.env]
  daylife = Daylife::API.new(daylife_config["api_key"],daylife_config["shared_secret"]) 
  users = User.all
  users.each do |user|
    
    # TODO this is not how it is suppose to be
    user_keyword_scores = UserKeywordScores.find_all_by_user_id(user.id)
    user_keyword_scores.each do |user_keyword_score|
      keyword = user_keyword_score.keyword.name
      keyword_score = user_keyword_score.score
      #start_time = yesterday().getutc.to_s().split(' ')[0]
      end_time = Time.now.getutc.to_s().split(' ')[0]
      
      r = daylife.execute('search', 'getRelatedArticles', :query => keyword, :limit => 10,  :start_time => end_time, :end_time => end_time, :sort => 'relevance')
    # Assuming that it will do a short cirtuit evaluation
      if(r.success? && r.articles.count > 3)
        
        (1..5).to_a.each do |i|
          a = r.articles[i]
          existing = Articles.find_by_name(a.url)
          if (existing.nil?)
            article = Articles.new
            article.name = a.url
            article.daylife_score = a.search_score
            article.headline = a.headline
            article.excerpt = a.excerpt
            article.timestamp_epoch = a.timestamp_epoch
            source = open(a.url).read
            ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
            valid_string = ic.iconv(source + ' ')[0..-2]
  #          print source
            article.content = Readability::Document.new(valid_string).content
    #        print article.content
            if article.save
              # Calculate the score of the article for that particular user
              existing = article
            end
          end
          # calculate score for existing article
          keyword_prob = keyword_score
          keyword_prob_headline = a.headline.scan(keyword).count / a.headline.split(' ').count
          keyword_prob_excerpt = a.excerpt.scan(keyword).count / a.excerpt.split(' ').count
          article_prob = r.articles.count / 10
          daylife_prob = existing.daylife_score / 10
          time_decay = existing.timestamp_epoch / Time.now.to_i
          total_score = (keyword_prob + keyword_prob_headline + keyword_prob_excerpt + article_prob + daylife_prob + time_decay) / 6
          feed = Feeds.new
          feed.article_id = existing.id
          feed.user_id = user.id
          feed.score = total_score
          feed.rating = 0
          feed.save
          end
        end          
    end
  end 
end

