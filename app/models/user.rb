# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :first_name, :last_name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :tasks
end
