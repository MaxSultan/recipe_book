# README

RecipeBook - Can I make this recipe with what I have in my pantry?
RecipeBook is a side project that was created so that I could learn more about being apps with ruby on rails.

Its features include:

- The ability to create Ingredients and recipes, add/remove ingredients from my pantry, view recipes where my pantry includes all needed ingredients
- Devise session based authentication
- accepts_nested_attributes in order to allow a user to create a recipe and ingredients at the same time
- model validations
- Integration/controller tests
- model validation tests
- Use of scopes
- A custom SQL query
- A CI/CD pipeline (github actions)
- Github Brach protections
- deployed on fly.io

Getting Started

1. clone down the repo
2. set your ruby version to 3.0.3
3. `bundle install`
4. `bin/setup`

Things you may want to cover:

- Ruby version: 3.0.3

- System dependencies: redis, postgresql

- Configuration

- Database creation

- Database initialization

- How to run the test suite: rails test

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

A deployed version of the app can be viewed here: https://bitter-resonance-6598.fly.dev/
