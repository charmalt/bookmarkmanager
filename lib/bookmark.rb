require 'pg'
require 'database'

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    con = Database.connect
    rs = con.exec 'SELECT * FROM bookmarks';
    rs.map { |row| Bookmark.new(row['id'],row['url'], row['title']) }
  end

  def self.add(url, title)
    con = Database.connect
    con.exec "INSERT INTO bookmarks (url, title)
    VALUES ('#{url}', '#{title}')";
  end

  def self.delete(title)
    con = Database.connect
    con.exec "DELETE FROM bookmarks
    WHERE title='#{title}'";
  end
end
