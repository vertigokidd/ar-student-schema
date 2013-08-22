require_relative '../../db/config'
require 'date'

class Teacher < ActiveRecord::Base
  has_many :subjects
  has_many :students, :through => :subjects

  validates :email, uniqueness: true



end