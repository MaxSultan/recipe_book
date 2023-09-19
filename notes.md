Hypothesis: MVP in 10 hours of coding.

MVP Road Map

- Authentication using Devise and a Devise User model
- Ingredient Model (name)
- User_Ingredient join table (amount?)
- Recipe (instructions, name)
- Recipe_Ingredients (amount)

Do I have the necessary ingredients in order to make this recipe?

- Devise views
- CRUD ingredients
- CRUD user_ingredients
- Pantry view (add ingredient, update ingredient, delete ingredient)
- Recipe View (index, show, new, create, update, edit, destroy, search)

  - search is a custom SQL query (get recipes where all ingredients are included in my pantry)

- Repo on Github: https://github.com/MaxSultan/recipe_book
- Deploy on FLy.io

Time Left: 10 hours

Add Basic Devise Auth:
bundle add devise
rails g devise:install
rails g devise:views
rails g devise User
rails db:migrate
