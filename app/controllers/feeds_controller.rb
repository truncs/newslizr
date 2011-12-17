require 'will_paginate/array'

class FeedsController < ApplicationController
  def index
    @feeds = Feeds.find_all_by_user_id(current_user.id, :order => "score DESC")
    @articles = []
    @feeds.each do |feed|
      @article = Articles.find_by_id(feed.article_id)
      @articles.push(@article)
    end
    respond_to do |format|
      format.html
      format .json {render json: @article}
    end
  end
end
