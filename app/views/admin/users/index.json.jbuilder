json.array!(@users) do |user|
  json.extract! user, :id, :login, :name, :salt, :encrypted_password, :last_login_at, :last_login_ip, :source
  json.url user_url(user, format: :json)
end
