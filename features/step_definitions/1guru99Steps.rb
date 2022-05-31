#Given I am on the sample homepage
Given(/^I am on the sample homepage$/) do
  visit 'http://demo.guru99.com/'
end

#When I enter blank details for Register
When(/^I enter blank details for Register$/) do
	fill_in 'emailid', :with => ""
end

#And Press the "Submit" button
When(/^Press the "([^"]*)" button$/) do |buttonName|
  click_button(buttonName)
end

#Then error "Email ID must not be blank" is show
Then(/^error "([^"]*)" is show$/) do |errorMessage|
  page.has_content?(errorMessage)
  sleep 2
end

#When I enter "carlos@test.com" for Register
When(/^I enter "([^"]*)" for Register$/) do |userName|
  fill_in 'emailid', :with => userName
end

#Then I should see the following table:
Then(/^I should see the following table:$/) do |table|
  loginMessage = 'Access details to demo site'
  find(:xpath, '/html/body/table/tbody/tr[1]/td/h2', :text => loginMessage)
  data = table.rows_hash
  counter = 4
  path= find("table")
  xpath_base_name = './tbody/tr[%i]/td[1]'
  xpath_base_name1 = './tbody/tr[%i]/td[2]'
  data.each_pair do |key, value|
     expect(path.find(:xpath, xpath_base_name % [counter])).to have_content(key)
     counter += 1 
  end
end


Then(/^I should see mngr(\d+) id$/) do |arg1|
  purchasedLabel = find(:xpath, '/html/body/table/tbody/tr[4]/td[2]', :text => /\Amngr\d\d\d\d\d\d\z/)
end
    