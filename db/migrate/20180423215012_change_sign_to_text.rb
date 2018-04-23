class ChangeSignToText < ActiveRecord::Migration[5.2]
  def change
    change_column :signs, :sign, :text
  end
end
