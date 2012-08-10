class XandersRailapp < Spinach::FeatureSteps
  When 'I go to the list of all todos' do
  	visit todos_path
  end

  Then 'I should see "No todos yet"' do
    page.should have_content "No todos yet"
  end

  Given 'there are 6 todos in the system' do
    6.times do |i|
    	Todo.create(:name => "Todo #" + i.to_s)
    end
  end

  Then 'I should see those 6 todos' do
    Todo.all.each do |todo|
    	page.should have_content(todo.name)
    end
  end

  And 'I click on "Create a new todo"' do
    click_link "Create a new todo"
  end

  And 'I create the todo correctly' do
    fill_in :name, :with => "A new todo"
    click_button :submit
  end

  Then 'I should see that todo, and a "Todo created succesfully" message' do
    page.should have_content Todo.first.name
    page.should have_content "Todo created succesfully"
  end

  And 'I delete one' do
    click_button :delete
  end

  Then 'there should be 5 todos in the system' do
    Todo.count.should eq 5
  end

  Given 'there are no todos yet' do
    Todo.delete_all
  end
end
