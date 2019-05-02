class CreateUserForm

  # on include active model pour avoir les validations
  include ActiveModel::Model

  # on crée un attr user_id pour générer la route du form
  attr_accessor :user_id

  # on crée les attr_accessor pour les champs du form
  attr_accessor :email, :first_name, :last_name, :phone

  # on ajoute les validations du form ici
  validates_presence_of :email, :first_name, :last_name

  # method pour instancier le form à partir d'un user
  def self.new_from_user(user)
    self.new(user_id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name, phone: user.phone)
  end

  # method pour submit le form
  def submit
    return false unless valid?
    # /!\ ici il faudrait catch le cas où le user n'est pas valide
    if user_id
      @user = User.find(user_id)
      @user.update(email: email, first_name: first_name, last_name: last_name, phone: phone)
    else
      @user = User.create(email: email, first_name: first_name, last_name: last_name, phone: phone)
    end
  end

end