require 'pg'
require './lib/database'

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.connect(database = Database)
    database.connect
    @database = database
  end

  def self.database
    @database
  end

  def self.all
    rs = self.database.all
    rs.map { |row| Bookmark.new(row[0], row[1], row[2]) }
  end

  def self.add(url, title)
    self.database.add(url, title)
  end

  def self.delete(title)
    self.database.delete(title)
  end

  def self.valid_url?(url)
    !!(url =~ /\A#{URI::regexp(['http', 'https'])}\z/)
  end

end
