module MailchimpWrapper
  def self.subscribe(user, group_name = nil, group = nil)
    mailchimp = Mailchimp::API.new(ENV['MAILCHIMP_API_KEY'])
    merge_vars = merge_vars_hash(user, group_name, group)
    mailchimp.lists.subscribe(
      ENV['MAILCHIMP_LIST_ID'],
      { email: user[:email] },
      merge_vars, 
      'html', 
      true, 
      true, 
      false, 
      false
      )
  end

  def self.merge_vars_hash(user, group_name, group)
    merge_vars = {}
    merge_vars[:fname] = user[:first_name] unless user[:first_name].blank?
    merge_vars[:lname] = user[:last_name] unless user[:last_name].blank?
    merge_vars[:city] = user[:city] unless user[:city].blank?
    merge_vars[:phone] = user[:phone] unless user[:phone].blank?
    merge_vars[:comment] = user[:comment] unless user[:comment].blank?
    groupings = { 0 => { name: group_name, groups: [group] } } if group_name && group
    merge_vars[:groupings] = groupings
    merge_vars
  end
end