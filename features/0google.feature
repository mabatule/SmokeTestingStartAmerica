Feature: As a internet user
         I want to use the google search engine
         so I test that works correctly


Scenario: Search for the Houston Dynamo Website        
  Given I am on the Google homepage
  When I search for "Houston Dynamo Tickets"
  Then I will click the "Tickets - Houston Dynamo FC" link

@runThis
Scenario: Searching for a UCB Site
  Given I am on the Google homepage
  When I search for "UCB Cochabamba"
  And I will click the "UCB - Cochabamba - Universidad Católica Boliviana" link  
  Then I see a link for the "SIAA"
  And I see a link for the "NEO LMS"
  And I see a link for the "Google Workspace"
  And I see text about working hours "Atención de lunes a viernes de 08:30 a 15:30"
  And for payments the schedule is "Cajas de 08:30 a 15:00"


