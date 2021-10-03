class Post < ApplicationRecord
    validates:title, :presence=>true, :length=>{:minimum=>3}
    validates:content, :presence=>true 
    has_many:comments, as: :commentable
end
