module UrlHelper

  def current_path
    URI.parse(current_url).path
  end

  def visit_login_page
    page.visit root_url
    find('a#Login').click
    verify_page_has_css(login_form)
  end

  :private

  def landing_page
    base_url
  end

  def visit_page(click_selector, landing_selector)
    link = find(click_selector)
    link.click
    sleep 2
    page_assertion landing_selector
  end

  def visit_page_with_xpath(click_selector, landing_selector)
    link = find(:xpath, click_selector)
    link.click
    page_assertion landing_selector
  end

  def clear_cookies
    browser = Capybara.current_session.driver.browser
    browser.manage.delete_all_cookies
  end

  def clear_session
    page.execute_script("localStorage.clear()")
    page.execute_script("sessionStorage.clear()")
  end

  def reset_session
    Capybara.reset_sessions!
  end

end

World(UrlHelper)