Given("there are grades in the gradebook") do
    @teacher = create(:user)
    @eric = create(:grade, :valid)
    @tomai = create(:grade, :valid)
    @schweller = create(:grade, :valid)
    @wylie = create(:grade, :valid)
end

Given("I sign in") do
    visit new_user_session_path
    fill_in "user_email", with: @teacher.email
    fill_in "user_password", with: "123greetings"
    click_on "Log in"
end

When("I visit the homepage") do
    visit root_path
end

Then ("I click on a user's name") do
    click_on @eric.student_name
end

When("I click {string}") do |string|
    click_on string
end

When("I fill out the form and submit") do
    fill_in "grade_student_id", with: "123456"
    fill_in "grade_student_name", with: "Bob Dylan"
    fill_in "grade_student_grade", with: 80
    click_on "Create Grade"
end

Then("I should have added a grade") do
    expect(page).to have_content("Grade was successfully created.")
end

Then("I should see everyone's grades") do
    @grades = Grade.all
    @grades.each do |g|
        expect(page.body).to include(g.student_id)
    end
end


Then("I should see that user's detailed grade information") do
    expect(page).to have_content(@eric.student_id)
    expect(page).to have_content(@eric.student_name)
    expect(page).to have_content(@eric.student_grade)
end

When("I click {string} on a post") do |string|
    click_on string, :match => :first
end

Given("I am on the homepage") do
    visit '/'
end
  
When("I go to the log in page") do
    visit '/users/sign_in'
end
  
Then("I should not be able to see the {string} button") do |string|
    expect(page).not_to have_content(string)
end









=begin
Given("I am signed in as a teacher") do
    #temp = User.create(email: "teacher@teacher.com", password: "default123", account_id: "1")
    #@user = temp
    #sign_in temp
    visit new_user_session_path
    fill_in "user_email", with: @teacher.email
    fill_in "user_password", with: "123greetings"
    click_on "Log in"
    visit root_path
end
=end
  
=begin
When("I go to create a grade") do
    click_on "New Grade"
    fill_in "grade_student_id", with: "123456"
    fill_in "grade_student_name", with: "Bob Dylan"
    fill_in "grade_student_grade", with: 80
    click_on "Create Grade"
end

  
Then("I should be able to create a grade") do
    expect(page).to have_content("Grade was successfully created.")
end
=end
  
=begin
Then("I go to read a grade") do
    click_on @eric.student_name
end

  
Then("I should be able to read a grade") do
    expect(page).to have_content(@eric.student_id)
    expect(page).to have_content(@eric.student_name)
    expect(page).to have_content(@eric.student_grade)
end
=end
  
Then("I go to update a grade") do
    click_link("Edit", :match => :first)
    fill_in "grade_student_id", with: "123456"
    fill_in "grade_student_name", with: "Bob Dylan"
    fill_in "grade_student_grade", with: 80
    click_on "Update Grade"
end
  
Then("I should be able to update a grade") do
    expect(page).to have_content("Grade was successfully updated.")
end
  
And("I go to delete a grade") do
    click_link("Destroy", :match => :first)
end
  
Then("I should be able to delete a grade") do
    expect(page).to have_content("Grade was successfully destroyed.")
end
