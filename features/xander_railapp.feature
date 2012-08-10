Feature: Xanders railapp
	It lets me manage todos

Background:
	Given there are no todos yet

Scenario: Listing all todos when there are none yet
	When I go to the list of all todos
	Then I should see "No todos yet"

Scenario: Listing all todos when there are some
	Given there are 6 todos in the system
	When I go to the list of all todos
	Then I should see those 6 todos

Scenario: Adding a todo
	When I go to the list of all todos
	And I click on "Create a new todo"
	And I create the todo correctly
	Then I should see that todo, and a "Todo created succesfully" message

Scenario: Deleting a todo
	Given there are 6 todos in the system
	When I go to the list of all todos
	And I delete one
	Then there should be 5 todos in the system

@javascript
Scenario: Marking a Todo as complete
	Given there are 6 todos in the system
	When I go to the list of all todos
	And I mark the first one as complete
	Then I should see "Completed"