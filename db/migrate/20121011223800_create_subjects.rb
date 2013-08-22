require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |entry|
      entry.belongs_to :teacher
      entry.belongs_to :student
      entry.string :subject
      entry.time :subject_time
    end
  end
end