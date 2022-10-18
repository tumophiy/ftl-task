# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.integer :value, null: false
      t.string :description

      t.timestamps
    end
  end
end
