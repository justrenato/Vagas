# frozen_string_literal: true

class CreateCandidaturas < ActiveRecord::Migration[7.0]
  def change
    create_table :candidaturas do |t|
      t.belongs_to :vaga, null: false, foreign_key: true
      t.belongs_to :pessoa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
