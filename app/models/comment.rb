class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, :body, presence: true
  after_create_commit :notify_author
  private
  def notify_author = CommentMailer.notify(self).deliver_later
end
