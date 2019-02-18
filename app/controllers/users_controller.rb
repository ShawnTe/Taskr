class UsersController < Clearance::UsersController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)

    redirect_to user
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

  def user_params
    params.require(:user).permit(:username, :text_number, :email, :password)
  end

end