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
[X] System Tests
[] Add error handling to form
[] Tests for error handling
[] improve the multiselect

## v2.0

Refactoring
[X] refactor Ingredients controller -> pantry controller for adding user_ingredients

CI/CD
[X] CI/CD rspec tests job
[X] CI/CD rubocop linting job
[] CI/CD system tests
[] CI/CD fly.io deploy https://fly.io/docs/app-guides/continuous-deployment-with-github-actions/

Feature: Ingredient Amounts
[] add amount to user_ingredients
[] add amount to recipe_ingredients
[] Update SQL query to include amount check

Styling
[] Styling
[] Theming in tailwindCSS
[] wireframes for consistent experience
[] improve mobile experience for all pages
[] Add a favicon
[] Make home index a landing page

API
[] look at linking out to other recipe sites/ spoonful API https://spoonacular.com/food-api/console#Dashboard
[] Rails Admin

Feature: weekly meal planner
[] Weekly meal planner that makes grocery list

Database
[] add DB validations that match model validations to prevent race conditions
