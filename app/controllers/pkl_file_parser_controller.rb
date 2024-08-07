class PklFileParserController < ApplicationController
  def upload
    args = params[:args] || []
    
    result = PklParserJob.perform_async(*args)

    render json: { result: 'OK' }
  end
end
