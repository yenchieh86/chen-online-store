class OwnerNoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.owner_notice_mailer.notify_message.subject
  #
  def notify_message
    @greeting = "Hi"

    mail(to: "yenchieh86@hotmail.com", subject: "New Message")
  end
end
