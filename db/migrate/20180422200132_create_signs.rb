class CreateSigns < ActiveRecord::Migration[5.2]
  def change
    create_table :signs do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :sign
      t.datetime :birthdate

      t.timestamps
    end
  end
end
