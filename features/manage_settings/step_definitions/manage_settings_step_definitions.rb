When(/^I click on my first simplan$/) do
  page.find(:xpath, first_simplan).click
  sleep 10
  verify_page_have_text('plan')
end

And(/^I click on the Settings link$/) do
  page.find(settings_link).click
end

Then(/^the settings page is displayed$/) do
  verify_page_have_text('settings')
end

When(/^I click on Edit link of Call Forwarding$/) do
  page.find(edit_call_forwarding_link).click
end

And(/^I click on Confirm button on the confirmation box$/) do
  page.find(:xpath, modal_confirm_button).click
  sleep 5
  verify_page_has_selector(call_forwarding_radio_button_yes)
end

And(/^I click Save$/) do
  page.find(:xpath, save_button).click
end

Then(/^I should see the sucess message$/) do
  verify_page_has_xpath_selector(success_message)
end

Given(/^I login to the login page$/) do
  visit_login
end

And(/^I enter "([^"]*)" on the forward calls input box$/) do |mobileno|
  enter_divert_number (mobileno)
end

And(/^I should see "([^"]*)" on the call forwarding area of the settings page$/) do |textinput|
  text_value = page.find(call_forwarding_setting).text
  verify_value(text_value, textinput)
end

And(/^I click on the "([^"]*)" radio button$/) do |arg|
  page.find(call_forwarding_radio_button_yes).click
  verify_page_has_selector("#my_amaysim2_setting_call_divert_number")
end