require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, uniqueness: true
  validates :email, format: { with: /\w+@\w+.\w{2,}/, message: 'invalid email'}
  validates :age, numericality: { greater_than: 5 }


  def name
    self.first_name + ' ' + self.last_name
  end

  def age
    bday_string = self.birthday.to_date
    # bday = bday_string.match(/\d.+/)[0]
    # bday_date = Date.strptime(bday, '%d %b %Y')
    now = Date.today
    ((now - bday_string)/365.25).to_i
  end

end
