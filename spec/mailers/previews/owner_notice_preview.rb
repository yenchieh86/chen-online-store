# Preview all emails at http://localhost:3000/rails/mailers/owner_notice
class OwnerNoticePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/owner_notice/notify_message
  def notify_message
    OwnerNoticeMailer.notify_message
  end

end
