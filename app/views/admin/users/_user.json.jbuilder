json.extract! user, :id, :email
json.url admin_user_url(user)
json.is_editable can? :manage, user
