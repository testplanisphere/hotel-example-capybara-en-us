# frozen_string_literal: true

class Icon < SitePrism::Page
  element :icon, '#icon'
  element :zoom, '#zoom'
  element :color, '#color'
  element :submit, '#icon-form > button'
  element :icon_message, '#icon ~ .invalid-feedback'
end
