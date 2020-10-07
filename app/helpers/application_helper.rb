require 'net/http'
module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email).downcase
    if user.avatar.attached?
            user.avatar.variant(resize: "100x100!")
  elsif user.image && !user.avatar.attached?
   "https://graph.facebook.com/#{user.uid}/picture?type=large"

 elsif gravatar?(user)
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"

  else
  "avatar.png"
    end
  end

#check for correct client id
  def stripe_express_path

"https://dashboard.stripe.com/express/oauth/authorize?response_type=code&client_id=ca_FDp3OkbKShUN65CTty7oW3jgHittszjw&scope=read_write"
  end
end




def gravatar?(user)
    gravatar_check = "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}.png?d=404"
    uri = URI.parse(gravatar_check)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.code.to_i != 404 # from d=404 parameter
end
