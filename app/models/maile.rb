class Maile < ActiveRecord::Base
  attr_accessible :name, :email, :subject, :body, :date, :delivery_status, :signed
  belongs_to :user

  validates_presence_of :name, :email, :subject, :body, :date
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def self.schedular_mail
   # user =  Maile.find_all_by_date_and_delivery_status(Date.today,'pending')
    user =  Maile.where('date <= ? and delivery_status = ?',Date.today,"pending")

    user.each do |u|
      token = Devise.friendly_token.to_s
      status = UserMailer.welcome_email(u,token).deliver!
      if status
        u.delivery_status = "sent"
        u.token = token  
        u.save
      end
    end
  end
   
  def self.pending_mail
    user = Maile.where('delivery_status= ?','pending')
  end
end
