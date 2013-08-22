require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |entry|
      entry.string :first_name
      entry.string :last_name
      entry.string :gender
      entry.string :birthday
      entry.string :email
      entry.string :phone
    end
  end
end
