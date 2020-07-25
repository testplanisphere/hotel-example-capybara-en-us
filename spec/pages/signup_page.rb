# frozen_string_literal: true

require 'pages/nav_section'

class Signup < SitePrism::Page
  section :nav, Nav
  element :email, '#email'
  element :password, '#password'
  element :password_confirmation, '#password-confirmation'
  element :username, '#username'
  element :rank_premium, '#rank-premium'
  element :rank_normal, '#rank-normal'
  element :address, '#address'
  element :tel, '#tel'
  element :gender, '#gender'
  element :birthday, '#birthday'
  element :notification, '#notification'
  element :submit, '#signup-form > button'
  element :email_message, '#email ~ .invalid-feedback'
  element :password_message, '#password ~ .invalid-feedback'
  element :password_confirmation_message, '#password-confirmation ~ .invalid-feedback'
  element :username_message, '#username ~ .invalid-feedback'
  element :address_message, '#address ~ .invalid-feedback'
  element :tel_message, '#tel ~ .invalid-feedback'
  element :gender_message, '#gender ~ .invalid-feedback'
  element :birthday_message, '#birthday ~ .invalid-feedback'
end
