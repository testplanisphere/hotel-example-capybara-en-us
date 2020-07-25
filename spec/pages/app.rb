# frozen_string_literal: true

require 'pages/top_page'
require 'pages/login_page'
require 'pages/signup_page'
require 'pages/my_page'
require 'pages/icon_page'
require 'pages/plans_page'
require 'pages/reserve_page'
require 'pages/confirm_page'

class App
  def top
    Top.new
  end

  def login
    Login.new
  end

  def signup
    Signup.new
  end

  def my_page
    My.new
  end

  def icon
    Icon.new
  end

  def plans
    Plans.new
  end

  def reserve
    Reserve.new
  end

  def confirm
    Confirm.new
  end
end
