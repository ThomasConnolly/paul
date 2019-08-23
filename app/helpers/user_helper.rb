# frozen_string_literal: true

module UserHelper
  def user_status(user)
    if user.invitation_acepted
      content_tag(:span, '', class: 'glyphicon glyphicon-ok color-success')
    else
      'Invitation pending'
    end
  end
end
