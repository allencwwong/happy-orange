class AddColToStore < ActiveRecord::Migration
  def change
    add_column :stores,:cuisine,:string
  end
end
