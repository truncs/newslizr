class UserSourceScores < ActiveRecord::Base
    belongs_to :users
    belongs_to :sources
end
