Feature: Check Teacher Authorization
    Scenario: Teacher should have full access to gradebook.
        Given there are grades in the gradebook
        And I sign in
        When I visit the homepage
        And I click "New Grade"
        And I fill out the form and submit
        Then I should have added a grade
        When I visit the homepage
        And I click "Show" on a post
        Then I should see that user's detailed grade information
        When I visit the homepage
        And I go to update a grade
        Then I should be able to update a grade
        When I visit the homepage
        And I go to delete a grade
        Then I should be able to delete a grade