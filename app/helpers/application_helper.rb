module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def admin?
    user_signed_in? && current_user.admin?
  end

  def subscribed?
    user_signed_in? && current_user.subscribed?
  end

  def subscribed_monthly?
    subscribed? && current_user.payment_plan == 'monthly'
  end

  def subscribed_yearly?
    subscribed? && current_user.payment_plan == 'yearly'
  end

  def refundable?
    user_signed_in? && current_user.refundable?
  end

  def trialable?
    user_signed_in? && !current_user.subscribed? && current_user.created_at.to_date + 7.days >= Time.zone.today
  end

  def remaining_trial_days
    if trialable?
      return (Time.zone.today - (current_user.created_at.to_date - 7.days)).to_i.to_s
    end
    return ""
  end

  def turbolinks_reload_control_meta_tag
    if session[:reload_page] == true
      session[:reload_page] = false

      tag :meta, name: 'turbolinks-visit-control', content: 'reload'
    end
  end
end
