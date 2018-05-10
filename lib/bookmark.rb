require 'pg'

class Bookmark

  attr_reader :id, :url

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    rs = con.exec 'SELECT * FROM bookmarks';
    rs.map { |row| Bookmark.new(row['id'],row['url']) }
  end

  def self.add(bookmark)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec "INSERT INTO bookmarks (url)
    VALUES ('#{bookmark}')";
  end
end
