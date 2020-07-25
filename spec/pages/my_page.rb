# frozen_string_literal: true

require 'pages/nav_section'

class My < SitePrism::Page
  section :nav, Nav
  element :icon_link, '#icon-link'
  element :header, 'h2'
  element :email, '#email'
  element :username, '#username'
  element :rank, '#rank'
  element :address, '#address'
  element :tel, '#tel'
  element :gender, '#gender'
  element :birthday, '#birthday'
  element :notification, '#notification'
  element :icon_image, '#icon-holder > img'
  element :delete, '#delete-form > button'
end
