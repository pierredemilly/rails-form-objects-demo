class User < ApplicationRecord

  # on ne require que l'email dans le model lui-même
  validates_presence_of :email

end
