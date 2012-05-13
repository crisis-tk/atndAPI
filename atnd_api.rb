# -*- coding: utf-8 -*-

require 'net/http'
require 'json'
require 'hashie'

class AtndAPI
  def initialize
    @api_url     = 'api.atnd.org'
    @api_port    = 80
  end

  def event_serach(params = {})
    json = get_json('/events/', make_query(params))
    Hashie::Mash.new(json)
  end

  private

  def make_query(params = {})
    query = []
    params.each do |key, value|
      query << key.to_s.strip + "=" + value.to_s.strip
    end
    query << 'format=json'
    query.join('&')
  end

  def get_json(request_url, query)
    json = nil
    Net::HTTP.version_1_2
    Net::HTTP.start(@api_url, @api_port) do |http|
      response = http.get(request_url + '?' + query)
      json = JSON.parse(response.body)
    end
    json
  end
end
