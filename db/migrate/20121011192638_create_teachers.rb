require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |entry|
      entry.string :first_name
      entry.string :last_name
      entry.string :gender
      entry.string :birthday
      entry.string :email
      entry.string :phone
    end
  end
end