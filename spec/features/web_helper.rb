def add_url
  visit '/'
  click_on 'Add'
  fill_in 'bookmark', with: 'http://facebook.com'
  fill_in 'title', with: 'Facebook'
  click_on 'Submit'
end

def add_invalid_url
  visit '/'
  click_on 'Add'
  fill_in 'bookmark', with: 'ddddd'
  click_on 'Submit'
end

def view_bookmarks
  visit '/'
  click_on 'View'
end

def view_delete
  visit '/'
  click_on 'Delete'
end

def select_and_delete
  check("0")
  click_on 'Delete'
end
