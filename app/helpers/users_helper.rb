module UsersHelper

  # returns gravatar for a given user
  def gravatar_for(user)
    gravatar_url = "https://secure.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email.downcase)}"
    image_tag(gravatar_url, alt: user.first_name, class: 'gravatar')
  end
end
