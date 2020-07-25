# frozen_string_literal: true

require 'pages/room_page'

class Reserve < SitePrism::Page
  element :reserve_date, '#date'
  element :date_picker_close, '.ui-datepicker-close'
  element :reserve_term, '#term'
  element :head_count, '#head-count'
  element :breakfast_plan, '#breakfast'
  element :early_check_in_plan, '#early-check-in'
  element :sightseeing_plan, '#sightseeing'
  element :username, '#username'
  element :contact, '#contact'
  element :email, '#email'
  element :tel, '#tel'
  element :comment, '#comment'
  element :submit, 'button[data-test="submit-button"]'
  element :plan_name, '#plan-name'
  element :reserve_date_message, '#date ~ .invalid-feedback'
  element :reserve_term_message, '#term ~ .invalid-feedback'
  element :head_count_message, '#head-count ~ .invalid-feedback'
  element :username_message, '#username ~ .invalid-feedback'
  element :email_message, '#email ~ .invalid-feedback'
  element :tel_message, '#tel ~ .invalid-feedback'
  iframe :room_frame, Room, 'iframe[name="room"]'
end
