class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_comment.subject
  #
  def new_comment(comment)
    @greeting = "Get to  the Chooooppppeerr"
    @id = comment.workout.id
    @user = comment.user
    mail to: comment.workout.user.email
  end
end
