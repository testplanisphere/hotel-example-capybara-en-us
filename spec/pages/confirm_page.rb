# frozen_string_literal: true

class Confirm < SitePrism::Page
  element :total_bill, '#total-bill'
  element :plan_name, '#plan-name'
  element :term, '#term'
  element :head_count, '#head-count'
  element :plans, '#plans'
  element :username, '#username'
  element :contact, '#contact'
  element :comment, '#comment'
  element :confirm, 'button[data-target="#success-modal"]'
  element :success_modal, '#success-modal'
  element :modal_message, '#success-modal > div > div > .modal-body'
  element :close, '#success-modal > div > div > div > button.btn-success'
end
