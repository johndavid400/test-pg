class ApiController < ApplicationController
  protect_from_forgery unless: -> { true }

  def success
    render status: 200, json: {success: true}.to_json
  end

  def timestamp
    response.headers['Retry-After'] = 30.minutes.from_now.utc.iso8601
    render status: 429, json: {success: false}.to_json
  end

  def seconds
    response.headers['Retry-After'] = 120
    render status: 429, json: {success: false}.to_json
  end

  def no_retry
    render status: 429, json: {success: false}.to_json
  end

  def error
    render status: 500, json: {success: false}.to_json
  end

end
