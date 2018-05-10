require 'pg'

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    rs = con.exec 'SELECT * FROM bookmarks';
    rs.map { |row| Bookmark.new(row['id'],row['url'], row['title']) }
  end

  def self.add(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec "INSERT INTO bookmarks (url, title)
    VALUES ('#{url}', '#{title}')";
  end

  def self.delete(title)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec "DELETE FROM bookmarks
    WHERE title='#{title}'";
  end
end
