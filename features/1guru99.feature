Feature: Guru99 Demo Page
   As a BDD student
   I want to test Guru99 registration page
   so I learn how to use Capybara

@maximize
Scenario: Register on Guru99 page without email        
	Given I am on the sample homepage
	When I enter blank details for Register
	And Press the "Submit" button
	Then error "Email ID must not be blank" is show

@maximize
Scenario: Register on Guru99 page with a valid email        
    Given I am on the sample homepage
	When I enter "carlos@test.com" for Register
    And Press the "Submit" button
	Then I should see the following table:
    | User ID	     |  mngr23537  |
 	  | Password     |  Ypegaza    | 

@maximize
Scenario Outline: Register on Guru99 page with a several emails        
  Given I am on the sample homepage
  When I enter "<email>" for Register
    And Press the "Submit" button
  Then I should see <username> id
  
Examples:
    | email               | username    | 
    |  carlos@test.com    |  mngr135053 |
    |  pepe@hotmail.com   |  mngr123467 |	  
    |  lucas@gmail.com    |  mngr187654 |

