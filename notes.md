Hypothesis: MVP in 10 hours of coding.

> Time Left: 7 hours

MVP Road Map
[X] Authentication using Devise and a Devise User model
[X] Ingredient Model (name)
Ingredients:
[X] create action (view and controller)
[X] read action
[] destroy action?

[X] User_Ingredient join table
[X] create action (create ingredient + join table and view)
[X] destroy action ()

[] Recipe (instructions, name)
[] Recipe_Ingredients (amount)

[] should I refactor Ingredients controller actions to use a separate controller when creating join tables and ingredients?

Do I have the necessary ingredients in order to make this recipe?

- Devise views
- CRUD ingredients
- CRUD user_ingredients
- Pantry view (add ingredient, update ingredient, delete ingredient)
- Recipe View (index, show, new, create, update, edit, destroy, search)

  - search is a custom SQL query (get recipes where all ingredients are included in my pantry)

- Repo on Github: https://github.com/MaxSultan/recipe_book
- Deploy on Fly.io
- Github actions
- rails tests

v1: just ingredient names
v2: ingredients with amounts

Add Basic Devise Auth:
bundle add devise
rails g devise:install
rails g devise:views
rails g devise User
rails db:migrate

When is has_many fine and when do you need has_many_through?
How do you decide what controller a feature action goes to?

has_nested_attributes
