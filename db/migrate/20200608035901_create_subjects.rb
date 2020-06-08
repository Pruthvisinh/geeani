class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :degree, foreign_key: true
      t.references :standard, foreign_key: true
      t.references :semester, foreign_key: true

      t.timestamps
    end
  end
end
