class PostReportJob < ApplicationJob
  queue_as :default

  def perform(user_id, post_id)
    # Do something later
    user = User.find(user_id)
    post = Post.find(post_id)
    report = PostReport.generate(post)
    PostReportMailer.post_report(user, post, report).deliver_now
  end
end
