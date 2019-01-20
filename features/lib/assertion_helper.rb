module AssertionHelper

  def verify_page_title_has_content(content)
    expect(page).to have_title content
  end

  def verify_page_has_no_content(a_content)
    expect(page).to have_no_content(a_content)
  end

  def verify_page_have_text text
    expect(page).to have_text text
  end

  def verify_page_has_no_text(text)
    expect(page).not_to have_text text
  end

  def verify_page_has_xpath_selector(a_xpath_selector)
    expect(page).to have_selector(:xpath, a_xpath_selector)
  end

  def verify_page_has_no_xpath(xpath)
    expect(page.has_no_xpath?(xpath)).to eq(true)
  end

  def verify_value(actual, expected)
    expect(actual).to eq(expected)
  end

  def verify_value_includes(actual, expected)
    expect(actual).to include(expected)
  end

  def verify_not_to_includes(actual, expected_not_to_include)
    expect(actual).not_to include(expected_not_to_include)
  end

  def verify_page_has_selector(a_selector)
    expect(page).to have_selector(a_selector)
  end

  def verify_page_has_no_selector(a_selector)
    expect(page).to have_no_selector(a_selector)
  end

  def verify_page_has_content(a_content)
    expect(page).to have_content(a_content)
  end

  def verify_css_value(element, css_attribute, value)
    expect(element.native.css_value(css_attribute)).to eq(value)
  end

  def verify_page_has_css(a_css)
    expect(page).to have_css(a_css)
  end

  def verify_page_has_no_css(css)
    expect(page.has_no_css?(css)).to eq(true)
  end

  def verify_checkbox_is_checked(element)
    expect(element).to be_checked
  end

  def verify_checkbox_is_not_checked(element)
    expect(element).not_to be_checked
  end

  def verify_expected_value_is_lesser(actual, expected)
    expect(actual).to be < expected
  end

  def verify_expected_value_is_greater(actual, expected)
    expect(actual).to be > expected
  end

  def verify_element_has_html_attribute(element, attribute, value)
    expect(element[attribute]).to include(value)
  end

  def verify_element_has_no_html_attribute(element, attribute, value)
    expect(element[attribute]).not_to include(value)
  end

  def verify_value_are_not_same(actual, expected)
    expect(actual).not_to be == expected
  end

  def verify_field_text_is_null_or_not_empty(field)
    expect(field == nil || (field.text != nil && field.text.strip != '')).to be true
  end

  def verify_element_is_disabled(element)
    expect(find(element)).to be_disabled
    #verify_value(verify_is_element_disabled?(element), false)
  end

  def verify_element_is_enabled(element)
    expect(find(element)).not_to be_disabled
  end

  def verify_is_element_disabled?(element)
    element[:disabled] ? true : false
  end

  def verify_2_arrays_are_equal (actual_array, expected_array)
    expect(actual_array).to match_array(expected_array)
  end

  def verify_a_path_contains_a_text(expected_path, text_to_find)
    expect(expected_path).to have_content(text_to_find)
  end

end
World(AssertionHelper)