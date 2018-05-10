class Database

  def self.con
    @con
  end

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect :dbname => 'bookmark_manager_test'
    else
      @con = PG.connect :dbname => 'bookmark_manager'
    end
  end

  def self.add(url, title)
    self.con.exec "INSERT INTO bookmarks (url, title)
    VALUES ('#{url}', '#{title}')";
  end

  def self.all
    rs = self.con.exec 'SELECT * FROM bookmarks';
    rs.map { |row| [row['id'],row['url'], row['title']] }
  end

end
