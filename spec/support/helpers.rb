def sign_in(username: Settings.get(current_lang.code).admin.username, password: Settings.get(current_lang.code).admin.password)
  visit sign_in_path
  fill_in 'sign_in_form[username]', with: username 
  fill_in 'sign_in_form[password]', with: password 
  click_button I18n.t('sign_in')
end

def current_lang
  current_lang = Lang.find_by(code: I18n.locale)
end
