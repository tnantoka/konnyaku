def sign_in(username: Settings.admin.username, password: Settings.admin.password)
  visit sign_in_path
  fill_in 'sign_in_form[username]', with: username 
  fill_in 'sign_in_form[password]', with: password 
  click_button I18n.t('sign_in')
end


