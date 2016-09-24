class CreateStrengths < ActiveRecord::Migration[5.0]
  def change
    create_table :strengths do |t|
      t.text :dosage

      t.timestamps
    end
  end
end
