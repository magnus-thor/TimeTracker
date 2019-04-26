# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.float :duration, default: 0

      t.timestamps
    end
  end
end
