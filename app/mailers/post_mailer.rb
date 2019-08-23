# frozen_string_literal: true

class PostMailer < ApplicationMailer
  # default to: Proc.new { User.all.pluck(:email) }

  def post_created(post)
    @post = post
    @post_id = post.id
    @url = url_for(@post)
    mail(to: @post.user.email,
         subject: "There's a new post on the parish website")
  end
end
