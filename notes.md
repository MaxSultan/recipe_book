## Notes

Add Basic Devise Auth:
bundle add devise
rails g devise:install
rails g devise:views
rails g devise User
rails db:migrate

When is has_many fine and when do you need has_many_through?
How do you decide what controller a feature action goes to?

## has_nested_attributes

- im creating a recipe but i need to create ingredients at the same time
- dynamically adding a piece of html to my form

## Fly Workflow

Deploying - `fly deploy`
Rails console - `fly ssh console --pty -C "/rails/bin/rails console"`

more info: https://fly.io/docs/rails/getting-started/existing/

## Icons

https://icones.js.org/collection/lucide?s=up

## Testing

testing controllers
testing views
testing models

### Testing Model validations -

tests live in the test folder

How do I write model validation tests?

1. select a model ans validation to test
2. setup the tests
3. execution
4. assertions

What are the pieces of model tests validations?

- `ingredient.valid?` - checks the validations of the model
- `ingredient.errors[:model_attribute].empty?` - check if the errors hash has a key for a model attribute
- `assert` - assert that whatever comes next is true
- `assert_not` - assert that whatever follows is false

run tests: `rails test [path/to/testfile]`

### Fixtures

Why use fixtures?
Fixtures allow you to provide sample test data for repeatable use across several tests.

How do I write fixtures?

Fixture tests are located in `test/fixtures/[model-name].yml`
you write yml with model attributes

you access them in the test like this:
`users(:regular).email`
^ this part looks at `test/fixtures/users.yml`

When tests finish they reset to whats in the yaml file.
Shared variables across tests cause problems
Can i reference another yaml file in a yaml file? yes

Errors running tests:

> RuntimeError: Foreign key violations found in your fixture data. Ensure you aren't referring to labels that don't exist on associations.

fix: all test become invalid when fixtures are messed up, you are referencing a fixture from another file. likely you changed the name, and now your referencing a fixture that doesn't exist

### Controller & Integration tests cheat sheet

Why use Controller and Integration tests?
They allow you to test controllers. Fast. These tests boot up a rails server and run api methods against them

### setup devise helpers

in `test/test_helper.rb` add this line: `include Devise::Test::IntegrationHelpers`

then we can use the login and log out methods like so:

```rb
  setup do
    sign_in users(:user1)
  end

  # and

  sign_out :user
```

where `sign_in` is a devise helper method and `users(:user1)` is a fixture

### How do I write a controller/integrations test?

#### setup -

#### api call

get/post/put/delete url_helper

#### types of assertions

```rb
assert_difference('Recipe.count') do
  #...
end

assert_no_difference('Recipe.count') do
  #...
end

assert_response :success
assert_response :redirect
assert_redirected_to
assert_equal
```

### add params to a path/url helper

```rb
post recipes_url, params: { recipe: { name: 'test', instructions: 'test test', ingredients: [] } }
```

### url helpers vs path helpers

### adding params to a url vs calling it as a function

get urls that need :id params need to be called as functions
posts/put need params explicitly specified

this one needs params:
`get recipes_show_url, params: { id: recipes(:one).id }`

but this is also valid

`get recipe_url(recipes(:one))`

Test what needs to happen, but don't do to much. Don't tie them to the UI design

## System Tests

https://github.com/teamcapybara/capybara#the-dsl

### Why systems tests?

test the entire app Javascript, Views, Routing, Controller, Model
Boot up a rails server and a browser
cons: slower and prone to more errors

we have to use url helpers in system tests (don't use path helpers). - we need to include the domain (localhost:3000). path helpers are just the path (/recipes/2)

the command `rails test` does not run system tests by default

as of rails 6, capybara/puma boot up 4 different databases and browsers adn paralellize the running of system tests

### “Can you teach me to write system tests?”

### “How do I write system tests?”

1. Require application_system_test_case

`require application_system_test_case`
this line needs to be included at the top of all system tests (located in tests/system)

2. define the test

```rb
test "descriptive name describing the test" do
end
```

3. Use devise helper methods to sign_in (if the route is protected)

```rb
test "descriptive name describing the test" do
  sign_in users(:user1) # this sets the cookie in chrome
end
```

5. Visit the url

```rb
test "descriptive name describing the test" do
  sign_in users(:user1)
  visit recipes_url
end
```

6. Make assertions

```rb
test "descriptive name describing the test" do
  sign_in users(:user1)
  visit recipes_url
  assert_selector "h1", text "Recipes"
end
```

7. Test user interactions

```rb
  test "can create ingredients" do
      sign_in users(:user1)
      visit ingredients_url
      assert_selector "h1", text: "Ingredients"

      click_on "Add an ingredient"
      fill_in "Name", with: "New Ingredient"
      click_on "Add Ingredient"

      assert_selector "h1", text: "Ingredients"
      assert_selector "li", text: "New Ingredient"
  end
```

### “What is ...?” (document the different pieces and how they work)

User interactions:

### “Why write system tests?”

### "when does this rule or pattern apply?"

system tests should tests processes instead of "lighter" things
system tests are for making sure that user flow work together as a whole (higher level)
integration tests are for testing a single action and making sure the correct process happens on the model
is the user forced to login before viewing this page - integration test
can a user create a recipe - system test

## Rails form errors

```rb
<% if user.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(user.errors.count, "error") %> prohibited this user from being saved:</h2>

      <ul>
      <% user.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>
```

## Diataxis framework starter

### “Can you teach me to…?”

### “How do I…?”

### “What is…?” (document the different pieces and how they work)

### “Why…?”

### "when does this rule or pattern apply?"
