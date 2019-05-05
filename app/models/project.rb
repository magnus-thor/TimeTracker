# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :user_projects
  has_many :users, through: :user_projects

  validates :name, :description, presence: true
end
