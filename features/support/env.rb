require 'capybara/cucumber'
require 'selenium/webdriver'

DEFAULT_MAX_WAIT_TIME = 30
use_browser = ENV['BROWSER']


#cleaning the existing reports.

FileUtils.rm_rf("reports")
FileUtils.mkdir_p("reports/junit")
FileUtils.mkdir_p("reports/json")
FileUtils.mkdir_p("reports/html")

puts 'Created necessary test report directories'

raise 'Unknown system under test please set the SUT value' if ENV['SUT'] == nil

class TestEnvironmentSettings
  attr_accessor :env_sut #sut - system under test

  def initialize
    self.env_sut=ENV['SUT'].upcase
  end
end

World { TestEnvironmentSettings.new }

module BeginSession

  def setup_base_url

    case env_sut #accessor from TestEnvironmentSettings class

    when 'PROD'
      @root_url = 'https://accounts.amaysim.com.au/identity/login'

    else
      raise 'Unknown system under test please set the SUT value'
    end

    puts "The url for this run is #{@root_url}"
  end

  def base_url
    @root_url
  end

  def root_url
    @root_url
  end

end

World(BeginSession)

Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|

  case use_browser

  when 'firefox'
    Capybara::Selenium::Driver.new(app, :browser => :firefox)

  when 'chrome'
    #Capybara::Selenium::Driver.new(app, :browser => :chrome, :service_log_path => 'app.out')
    chrome_options = Selenium::WebDriver::Chrome::Options.new
    chrome_options.add_argument('--enable-popup-blocking')
    chrome_options.add_argument('--enable-external-protocol-request')
    chrome_options.add_argument('--disable-extensions')
    chrome_options.add_argument('--test-type')
    chrome_options.add_argument('--disable-binary')
    # Capybara::Selenium::Driver.new(app, :browser => :chrome, :options => %w[ --enable-popup-blocking --enable-external-protocol-request --disable-extensions --test-type])
    Capybara::Selenium::Driver.new(
        app,
        :browser => :chrome,
        :options => chrome_options
    )
  when 'ie'
    Capybara::Selenium::Driver.new(app, :browser => :ie)

  when 'chrome_headless'
    args = ['--enable-popup-blocking', '--enable-external-protocol-request', '--disable-extensions',
            '--headless', '--disable-gpu', '--no-sandbox', '--window-size=1280,800', '--verbose',
            '--disable-impl-side-painting', '--ignore-certificate-errors', '--incognito']
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => args})
    Capybara::Selenium::Driver.new(
        app,
        browser: :remote,
        url: "http://localhost:4444/wd/hub",
        desired_capabilities: caps)


  when 'chrome_grid'
    args = ['--enable-popup-blocking', '--enable-external-protocol-request', '--disable-extensions', '--test-type']
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("goog:chromeOptions" => {"args" => args})
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => args, "timeout" => 120})
    Capybara::Selenium::Driver.new(
        app,
        browser: :remote,
        url: "http://localhost:4444/wd/hub",
        desired_capabilities: caps)

  else
    raise 'Unidentified BROWSER. Please set which browser to use. e.g. BROWSER=firefox or chrome or ie'
  end
end

if RUBY_PLATFORM.to_s.include?('linux') == false #this to safe guard that the linux boxes are not disturbed
  ENV['HTTP_PROXY'] = nil
end

$browser = Capybara.current_session.driver.browser #this would give you the access to the driver instance
$browser.manage.window.resize_to(1680, 1050)
Capybara.default_max_wait_time = DEFAULT_MAX_WAIT_TIME
Capybara.default_selector = :css
# Capybara::Screenshot.autosave_on_failure = true
# Capybara::Screenshot::RSpec::REPORTERS["RSpec::Core::Formatters::HtmlFormatter"] = Capybara::Screenshot::RSpec::HtmlLinkReporter
