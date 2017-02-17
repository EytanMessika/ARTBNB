class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact, :subscribe ]

  def home
  end
  def about
  end
  def contact
  end

  def subscribe
    begin
      NewsletterOk.new.run(params)

      flash[:notice] = "You successfully subscribed to the You n' Art newsletter!"
    rescue Gibbon::MailChimpError => e
      flash[:alert] = e.message
    end
    redirect_to root_path
  end

end
