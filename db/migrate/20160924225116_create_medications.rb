class CreateMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :medications do |t|
      t.text :name

      t.timestamps
    end
  end
end
