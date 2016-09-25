class CreateUserMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :user_medications do |t|
      t.references :user 
      t.references :medication 
      t.timestamps
    end
  end
end
