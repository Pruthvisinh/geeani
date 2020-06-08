class CreateDegrees < ActiveRecord::Migration[5.2]
  def change
    create_table :degrees do |t|
      t.string :name
      t.references :college, foreign_key: true

      t.timestamps
    end
  end
end
