# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
