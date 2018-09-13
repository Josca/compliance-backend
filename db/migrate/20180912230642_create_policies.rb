# frozen_string_literal: true

# Create policies table, meant to store policy attributes from OpenSCAP
class CreatePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :policies do |t|
      t.string :name

      t.timestamps
    end
    add_index :policies, :name, unique: true
  end
end
