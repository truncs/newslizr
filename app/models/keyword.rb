class Keyword < ActiveRecord::Base
    has_many :users
    has_many :user_keyword_scores
end
