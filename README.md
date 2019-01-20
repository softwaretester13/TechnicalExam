##  TO run cucumber test

This instructions are for Windows

1. Download and install chromedriver and set to PATH
2. Download and install ruby from https://rubyinstaller.org/downloads/
3. Go to cmd line
4. cd to working directory e.g. ~/TechnicalExam where this Project was downloaded
5. Install bundler by running "gem install bundler"  on cmd line
6. Run "bundle install" to install all gems on Gemfile
7. Run "cucumber -t @manage_call_forward_test SUT=PROD BROWSER=chrome"


