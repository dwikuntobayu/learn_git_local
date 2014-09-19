#=====================================
# this setup used if you not config in development.rb,
# so you don't need setup in every environtment
#=====================================
# require "action_mailer"
#
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
  # :address              => "smtp.gmail.com",
  # :port                 => 465,
  # :domain               => '@gmail.com',
  # :user_name            => 'develror',
  # :password             => '12345^&*()',
  # :authentication       => "login",
  # :ssl                  => true,
  # :tls                  => true,
  # :enable_starttls_auto => true
# }

class TryMailer < ActionMailer::Base
  def send_mailer
    @destination = "dwikunto.bayu@kiranatama.com"
    unless @destination.blank?
      mail(:to => @destination,
        :from => "develror@gmail.com",
        :subject => "[Training - Rails 4]") do |format|
        format.text { render :text => "Hello Rails4"}
        format.html { render :text => "<p>Hello Rails 4<\p>"}
      end
    end
  end
end
