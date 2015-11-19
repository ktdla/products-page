class SubscribeController < ApplicationController
  include Refinery::I18n
  def create
    logger.info "suscripcion #{params.inspect}"
    user = user_params(params)
    MailchimpWrapper.subscribe(user, params[:group_name], params[:group])
    render 'refinery/pages/gracias'
  rescue Mailchimp::Error => e
    logger.error "ERROR mailchimp #{e.message} #{params.inspect}"
  end

  private

  def user_params(params)
    user = {
      email: params[:email].try(:downcase),
      first_name: params[:first_name].try(:titleize),
      last_name: params[:last_name].try(:titleize),
      city: params[:city].try(:titleize),
      comment: params[:comment].try(:titleize)
    }
    user
  end
end