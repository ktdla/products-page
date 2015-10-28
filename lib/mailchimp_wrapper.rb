module MailchimpWrapper
  def self.subscribe(user)
    mailchimp = Mailchimp::API.new(ENV['MAILCHIMP_API_KEY'])
    merge_vars = merge_vars_hash(user)
    mailchimp.lists.subscribe(
      ENV['MAILCHIMP_LIST_ID'],
      { email: user[:email] },
      merge_vars)
  end

  def self.merge_vars_hash(user)
    merge_vars = {}
    merge_vars[:fname] = user[:first_name] unless user[:first_name].blank?
    merge_vars[:lname] = user[:last_name] unless user[:last_name].blank?
    merge_vars
  end
end