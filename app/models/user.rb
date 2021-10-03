class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_voter

  validates:name, :presence=>true
  validates:surname, :presence=>true
  validates:part, :presence=>true
  validate:non_negative_part

  def non_negative_part
    if !part.nil?
      if (part<0)
        errors.add('Udział w nieruchomości','musi być liczbą dodatnią')
      end
    end
  end

end
