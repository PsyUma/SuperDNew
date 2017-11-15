class UserMailer < ApplicationMailer
  default from: 'uni.umakant@gmail.com'

  def semail(user,bodytext)
    @user = user
    @user.each do |row|
      welcome_email(row,bodytext)
    end
  end

  def welcome_email(user,bodytext)
    @user = user
    @embody = bodytext
    mail(to: 'uni.umakant@gmail.com', subject: 'Updates from SuperD')
  end

end
