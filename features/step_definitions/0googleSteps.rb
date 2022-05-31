4#Given I am on the Google homepage
Given(/^I am on the Google homepage$/) do
  page.driver.browser.manage.window.maximize
  visit ('/')
end

#When I search for "houston dynamo tickets"
When(/^I search for "([^"]*)"$/) do |valueToSearch|
  fill_in('q',:with => valueToSearch).native.send_keys(:return)
end

#Then I will click the "Tickets | Houston Dynamo" link
Then(/^I will click the "([^"]*)" link$/) do |searchLink|
  click_link(searchLink)
end

#Then I see a link for the "SIAA"
Then('I see a link for the {string}') do |ucbLink|
  expect(page).to have_link(ucbLink)
end


#Then UCB is located at "M.M.Marques, Cochabamba" street
Then(/^I see that the UCB is located at "([^"]*)" street$/) do |adUCB|
  address = find(:xpath, '/html/body/div[7]/div/div[10]/div[2]/div/div/div[2]/div/div[3]/div/div/div/div/div[1]/div/div/div/div/div[4]/div/div/div/span[2]')
  if address.text != adUCB
    	raise "UCB address should be"+adUCB	
    end
end

#And I see text about working hours "Atención de lunes a viernes de 08:30 a 15:30"
Then('I see text about working hours {string}') do |workingHoursUCB|
  workingHoursLabel = find(:xpath, '/html/body/div[1]/div[2]/section[1]/div[1]/div/div[3]/div/ul/li[1]/div')
  puts workingHoursLabel.text
  if workingHoursLabel.text != workingHoursUCB
    	raise "Working hours should be"+workingHoursUCB	
  end
end

#And for payments the schedule is "Cajas de 08:30 a 15:00"
Then('for payments the schedule is {string}') do |payingLineSchedule|
  payinglineScheduleText = find(:css, '#wrapper > section.fusion-tb-header > div.fusion-fullwidth.fullwidth-box.fusion-builder-row-3.fusion-flex-container.nonhundred-percent-fullwidth.non-hundred-percent-height-scrolling > div > div.fusion-layout-column.fusion_builder_column.fusion-builder-column-4.fusion_builder_column_1_3.\31 _3.fusion-flex-column.fusion-flex-align-self-center > div > ul > li:nth-child(2) > div').text
  puts payinglineScheduleText
  if payinglineScheduleText != payingLineSchedule
    raise "Paying line working hours should be"+payingLineSchedule	
  end

end