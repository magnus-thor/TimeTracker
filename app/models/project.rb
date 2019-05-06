# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :user_projects, dependent: :delete
  has_many :users, through: :user_projects

  validates :name, :description, presence: true
end
