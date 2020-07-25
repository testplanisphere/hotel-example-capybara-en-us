# frozen_string_literal: true

feature 'Login' do
  given(:app) { App.new }

  scenario 'should be successful logged in preset user' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'clark@example.com'
    app.login.password.set 'password'
    app.login.submit.click

    expect(app.my_page.header).to have_text('MyPage')
  end

  scenario 'should be an error when empty input' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set ''
    app.login.password.set ''
    app.login.submit.click

    expect(app.login.email_message).to have_text('Please fill out this field.')
    expect(app.login.password_message).to have_text('Please fill out this field.')
  end

  scenario 'should be an error when invalid user' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'error@example.com'
    app.login.password.set 'error'
    app.login.submit.click

    expect(app.login.email_message).to have_text('Email or password is invalid.')
    expect(app.login.password_message).to have_text('Email or password is invalid.')
  end
end
