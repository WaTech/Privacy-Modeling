module Admin::UsersHelper
  def available_user_roles
    { admin: %w(admin), super_admin: %w(admin super_admin) }[current_user.role.to_sym].map do |user_role|
      [I18n.t("users.roles.#{ user_role }"), user_role]
    end
  end
end
