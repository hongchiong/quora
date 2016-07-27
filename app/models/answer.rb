class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :answer_votes
  # has_secure_password
  # validates_uniqueness_of :username, :email
  # validates_format_of :username, :with => /\A[a-zA-Z0-9]+\Z/
 #  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

  # def create
  #   @user = User.new(params[:user])
  #   @user.password = params[:password]
  #   @user.sav!
  # end

end