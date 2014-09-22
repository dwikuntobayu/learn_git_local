class CreateFamiliesHomes < ActiveRecord::Migration
  def change
    create_table :families_homes do |t|
      t.integer :family_id
      t.integer :home_id

      t.timestamps
    end
  end
end
