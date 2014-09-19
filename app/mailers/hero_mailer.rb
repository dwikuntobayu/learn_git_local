#=====================================
# this setup used if you not config in development.rb,
# so you don't need setup in every environtment
#=====================================
# require "action_mailer"
#
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
#   :address              => "smtp.gmail.com",
#   :port                 => 587,
#   :domain               => '@gmail.com',
#   :user_name            => 'develror',
#   :password             => '12345^&*()',
#   :authentication       => "plain",
#   # :ssl                  => true,
#   # :tls                  => true,
#   :enable_starttls_auto => true
# }

class HeroMailer < ActionMailer::Base

  def htm_mail(target_email, activation_token)
    @activation_token = activation_token
    mail(:to => target_email,
      :from => "develror@gmail.com",
      :subject => "[Training - Rails 4]") do |format|
      format.html { render 'htm_mail'}
      #format.text { render 'txt_mail'}
    end
  end

end
