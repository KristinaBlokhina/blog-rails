class CommentMailer < ApplicationMailer
  def notify(comment)
    @comment = comment
    mail to: "author@example.com", subject: "Новий коментар до «#{comment.article.title}»"
  end
end
