class TwitterController < ApplicationController
  def search
    @tw_result = TwSearchResult.new
    if params[:word]
      @tw_result.word = params[:word]
      @tw_result.tweet = @tw_result.client.search("-RT #{params[:word]} ", result_type: 'recent', count: 10)

    end
  end
end