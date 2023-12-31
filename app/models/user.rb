# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_ingredients, dependent: :destroy
  has_many :ingredients, through: :user_ingredients

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
