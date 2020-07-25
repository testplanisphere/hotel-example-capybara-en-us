# frozen_string_literal: true

require 'pages/nav_section'

class Top < SitePrism::Page
  set_url '/en-US/'

  section :nav, Nav
end
