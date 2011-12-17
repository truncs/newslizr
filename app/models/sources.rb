class Sources < ActiveRecord::Base
    has_many :user_source_scores
    has_many :users, :through => :user_source_scores
end
