def grab_screen_shot
  encoded_img = page.driver.browser.screenshot_as(:base64)
  embed("data:image/png;base64,#{encoded_img}", 'image/png')
end

def save_screenshot
  path = screenshot_path
  clear_save_and_open_page_path do
    result = Capybara::Screenshot.registered_drivers.fetch(capybara.current_driver) { |driver_name|
      warn "capybara-screenshot could not detect a screenshot driver for '#{capybara.current_driver}'. Saving with default with unknown results."
      Capybara::Screenshot.registered_drivers[:default]
    }.call(page.driver, path)
    @screenshot_saved = result != :not_supported
  end
end

@time

Before do
  setup_base_url
end

Before do |scenario|
  @time = Time.now
end

After do |scenario|
  # page.driver.reset!
  if (scenario.failed?)
    grab_screen_shot
    page.visit("#{landing_page}pa/oidc/logout")
  end
  # $browser.manage.delete_all_cookies #This is to delete cookies as there is a bug in capybara where in reset session cookies are not cleared. $browser is coming from env.rb
  # Capybara.current_session.driver.browser.manage.delete_all_cookies
  #Capybara.page.driver.quit
  clear_cookies
end

