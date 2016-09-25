class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name 
      t.string :insurance_plan_number
      t.string :insurance_type
      t.string :insurance_name
      t.integer :cost_per_month_before_gap
      t.integer :cost_per_month_during_gap
      t.integer :cost_per_month_after_gap
      t.integer :months_before_gap
      t.integer :months_during_gap
      t.integer :months_after_gap

      t.timestamps
    end
  end
end
