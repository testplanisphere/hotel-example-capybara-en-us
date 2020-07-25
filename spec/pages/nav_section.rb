# frozen_string_literal: true

class Nav < SitePrism::Section
  set_default_search_arguments 'nav'

  element :login_link, :link, 'Login'
  element :signup_link, :link, 'Sign up'
  element :plan_link, :link, 'Reserve'
end
