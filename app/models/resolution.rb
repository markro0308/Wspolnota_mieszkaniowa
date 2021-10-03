class Resolution < ApplicationRecord
    validates:titleR, :presence=>true, :length=>{:minimum=>3}
    validates:contentR, :presence=>true 
    has_many:comments, as: :commentable
    acts_as_votable
end
