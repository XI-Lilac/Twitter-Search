class TwitterController < ApplicationController
  def search
    @tw_result = TwSearchResult.new
    if @tw_result && params[:word]
      @tw_result.word = params[:word]
      @tw_result.tweet = @tw_result.client.search("-RT #{@tw_result.word} ", lang: "ja", result_type: 'recent', count: params[:limit])
      respond_to do |format|
      	format.html
      end
    end
    
    rescue => e
    logger.error e.message
    flash[:error] = "エラーが起きました[#{e.message}]"
    render root_path
    end
end