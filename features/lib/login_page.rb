module LoginPage

  def visit_login
    page.visit @root_url
    user_login "0468340754", "theHoff34"
    page.find(login_button).click
    sleep 10
    verify_page_have_text('my dashboard')
  end

  def user_login(email, password)
      fill_in 'username', :with => email
      fill_in 'password', :with => password
  end

  def login_button
    "#new_session > button"
  end

end

World(LoginPage)