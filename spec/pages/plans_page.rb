# frozen_string_literal: true

require 'pages/nav_section'

class Plans < SitePrism::Page
  section :nav, Nav
  element :loading, '#plan-list > div[role="status"]'
  elements :plan_titles, '.card-title'
  elements :plans, '.card'
  load_validation { has_no_loading? }
end
