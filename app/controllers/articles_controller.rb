class ArticlesController < ApplicationController

  def show
    @article = Articles.find(params[:id])

    respond_to do |format|
      format.html
      format.json {redner json:@article} 
    end
  end
end
