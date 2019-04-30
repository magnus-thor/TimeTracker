# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, presence: true
  validates :duration, presence: true
  belongs_to :project
end
