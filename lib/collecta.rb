require "rubygems"
require "net/http"
require "uri"
require "cgi"
require "json"
require "xml"


class Collecta
  
  @@api_key = nil
  @@api_url = "http://api.collecta.com/search"
  
  def self.api_key
    @@api_key
  end
  
  def self.api_key=(key)
    @@api_key = key
  end
  
  def self.search(q = nil, params = {})
    if !q.nil? && q != ""
      params[:q] = q
      return self.request(params)
    end
    return false
  end
  
  def self.request(options = {})
    params = {}
    params[:api_key] = @@api_key if options[:api_key].nil?
    params[:format]  = (!options[:format].nil?) ? options[:format] : "atom"
    valid_params = [:q, :rpp, :page, :since_id, :callback, :category, :exclude]
    valid_params.each do |param|
      params[param] = options[param] if !options[param].nil?
    end
    request_url = self.build_url(params.clone)
    if request_url
      response = Net::HTTP.get(URI.parse(request_url))
      case params[:format]
      when "hash"
        return JSON.parse(response)
      when "atom"
        parser = XML::Parser.string(response)
        doc = parser.parse
        doc.find('//feed/entry').each do |p|
          puts p.inspect
        end
      else
        return response
      end
    end
    return false
  end
  
  def self.build_url(params)
    if !params[:q].nil? && !params[:api_key].nil?
      # show specific categories
      if params[:category].is_a?(Array) && params[:category].size > 0
        params[:q] << params[:category].map { |item| " category:#{item}"}.join(" OR")
      elsif params[:category].is_a?(String)
        params[:q] << params[:category] && params[:category] != ""
      end
      params.delete(:category)
      # exclude specific categories
      if params[:exclude].is_a?(Array) && params[:exclude].size > 0
        params[:q] << params[:exclude].map { |item| " -category:#{item}"}.join(" OR")
      elsif params[:exclude].is_a?(String)
        params[:q] << params[:exclude] && params[:exclude] != ""
      end
      params.delete(:exclude)
      return @@api_url + self.build_query(params)
    end
    return false
  end
  
  def self.build_query(params, first = true)
    query = (first) ? "?" : ""
    params[:format] = "json" if params[:format] == "hash"
    return query << params.map { |name, value| "#{name}=" + CGI::escape(value).gsub("+", "%20") }.join("&")
  end
  
end
