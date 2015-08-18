require 'net/http'
require 'uri'

class ExternalService < ActiveRecord::Base
  attr_accessible :name, :url

  validates :url, presence: true

  validate do
    return if url.blank?
    begin
      Net::HTTP.get(URI(url))
    rescue
      errors.add(:url, "can't get url")
    end
  end

end
