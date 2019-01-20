module SettingsPage

  def edit_call_forwarding_link
    "#edit_settings_call_forwarding"
  end

  def modal_confirm_button
    "//a[text()='Confirm']"
  end

  def enter_divert_number (mobilenumber)
    #fill_in '#my_amaysim2_setting_call_divert_number', :with => mobilenumber
    page.find(mobile_divert_number_textfield).set(mobilenumber)
  end

  def save_button
    "//input[@value='Save']"
  end

  def success_message
    "//p[text()='We have successfully updated your SIM settings.']"
  end

  def call_forwarding_setting
    "#settings_call_forwarding > div > div> div.small-1.medium-2.large-1.columns.bold.text-right.setting-option-value-text"
  end

  def call_forwarding_radio_button_yes
    "#update_call_forwarding_form > div:nth-child(2) > div > label:nth-child(1) > span"
  end

  def mobile_divert_number_textfield
    "#my_amaysim2_setting_call_divert_number"
  end

end

World(SettingsPage)