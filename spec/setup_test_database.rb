require 'pg'

p "Setting up test database..."

con = PG.connect(dbname: 'bookmark_manager_test')

con.exec("TRUNCATE bookmarks;")
