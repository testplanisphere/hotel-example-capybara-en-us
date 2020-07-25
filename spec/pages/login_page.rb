# frozen_string_literal: true

require 'pages/nav_section'

class Login < SitePrism::Page
  section :nav, Nav
  element :email, '#email'
  element :password, '#password'
  element :submit, '#login-button'
  element :email_message, '#email-message'
  element :password_message, '#password-message'
end
