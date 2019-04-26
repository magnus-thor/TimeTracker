# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, presence: true
  validates :duration, presence: true

  # method sem setur time.current í column
  # method sem stoppar or reiknar tima frá því tíminn startaði og update-ar task.length
end
