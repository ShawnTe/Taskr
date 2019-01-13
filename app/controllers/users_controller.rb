class UsersController < Clearance::UsersController

  def new
    @user = user_from_params
    render 'sessions/new'
  end

private

  def user_from_params
    username = user_params.delete(:username)
    text_number = user_params.delete(:text_number)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.username = username
      user.text_number = text_number
      user.email = email
      user.password = password
    end
  end

end