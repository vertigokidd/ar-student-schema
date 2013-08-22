require_relative '../../db/config'
require 'date'

class Teacher < ActiveRecord::Base
  has_many :students

  validates :email, uniqueness: true



end