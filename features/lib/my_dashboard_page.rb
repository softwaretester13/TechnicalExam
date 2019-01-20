module MyDashboardPage

def first_simplan
  "//a[@data-automation-id='mobile-card'][1]"
end

def settings_link
  "#menu_list > li:nth-child(8) > a"
end
end

World(MyDashboardPage)