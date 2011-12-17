class Feeds < ActiveRecord::Base
  belongs_to :articles
  belongs_to :users
end
