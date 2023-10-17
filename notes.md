Do I have the necessary ingredients in order to make this recipe?
Hypothesis #1: MVP in 10 hours of coding. (done)

Hypothesis #2: Weekly meal planner that makes grocery list (8 hours)

> Time Left: 8 hours

MVP Road Map
[X] Authentication using Devise and a Devise User model
[X] Ingredient Model (name)
Ingredients:
[X] create action (view and controller)
[X] read action

[X] User_Ingredient join table
[X] create action (create ingredient + join table and view)
[X] destroy action ()

[X] Recipe (instructions, name)
[X] Recipe_Ingredients (amount)

[X] Show Recipes where all ingredients are in my pantry
[X] add tailwind
[X] Validation Tests
[X] Integration/ controller tests
[] System Tests

## v2.0

Refactoring
[X] refactor Ingredients controller -> pantry controller for adding user_ingredients

CI/CD
[X] CI/CD rspec tests job
[X] CI/CD rubocop linting job
[] CI/CD fly.io deploy https://fly.io/docs/app-guides/continuous-deployment-with-github-actions/

Feature: Ingredient Amounts
[] add amount to user_ingredients
[] add amount to recipe_ingredients
[] Update SQL query to include amount check

Styling
[] Styling and
[] add theming in tailwindCSS
[] wireframes for consistent experience
[] improve mobile experience for all pages
[] Add a favicon
[] Make home index a landing page

Accessibility
[] Make a better implementation of a multiselect element

API
[] look at linking out to other recipe sites/ spoonful API
[] Rails Admin

Feature: weekly meal planner
[] Weekly meal planner that makes grocery list

Database
[] add DB validations that match model validations to prevent race conditions

## Notes

Add Basic Devise Auth:
bundle add devise
rails g devise:install
rails g devise:views
rails g devise User
rails db:migrate

When is has_many fine and when do you need has_many_through?
How do you decide what controller a feature action goes to?

## jhas_nested_attributes

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

run tests: `rails test [path/to/testfile]`

### Fixtures

When to use?
you need sample test data for repeatable use across several tests

the go in test/fixtures/[model-name].yml
you write yml with model attributes

you access them in the test like this:
users(:regular).email
^ this part looks at test/fixtures/users.yml

When tests finish they reset to whats in the yaml file.
Shared variables across tests cause problems
Can i reference another yaml file in a yaml file? yes

Errors running tests:

> RuntimeError: Foreign key violations found in your fixture data. Ensure you aren't referring to labels that don't exist on associations.

fix: all test become invalid when fixtures are messed up, you are referencing a fixture from another file. likely you changed the name, and now your referencing a fixture that doesn't exist

### Controller/Integration tests cheat sheet

setup devise helpers
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

### add params to a path/url helper

```rb
post recipes_url, params: { recipe: { name: 'test', instructions: 'test test', ingredients: [] } }
```

### types of assertions

```rb
assert_difference('Recipe.count') do
  #...
end

assert_no_difference('Recipe.count') do
  #...
end

assert_response :success
assert_response :redirect
```

### url helpers vs path helpers

### adding params to a url vs calling it as a function

urls that need :id params need to be called as functions
posts need params explicitly specified
