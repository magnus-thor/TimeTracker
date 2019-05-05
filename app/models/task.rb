# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, :duration, presence: true
  belongs_to :project
  belongs_to :user
end
