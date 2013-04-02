class Notifier < ActionMailer::Base
  default :from=> "richard.zhou@aicure.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.password_retrieve.subject
  #
  def retrieve_password(user)
    @message = "Thank you!"
    mail(:to => user.email, :subject => "Password Retrieval")
  end
end
