class Site < ApplicationController
  def self.find(*)
    new
  end

  def blotter
    $redis.with do |conn|
      conn.get('kitsu:blotter')
    end
  end

  def blotter=(value)
    $redis.with do |conn|
      conn.set('kitsu:blotter', value)
    end
  end
end
