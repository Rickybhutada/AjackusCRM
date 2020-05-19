# config/initializers/smtp.rb
puts "hello"
puts "#{Rails.configuration.x.settings['SENDGRID_USERNAME']}"
ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    user_name: "#{Rails.configuration.x.settings['SENDGRID_USERNAME']}",
    password: "#{Rails.configuration.x.settings['SENDGRID_PASSWORD']}",
    authentication: :plain,
    enable_starttls_auto: true
}