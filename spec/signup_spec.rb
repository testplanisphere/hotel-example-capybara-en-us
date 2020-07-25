# frozen_string_literal: true

feature 'Sign up' do
  given(:app) { App.new }

  scenario 'should be successful sign up' do
    app.top.load
    app.top.nav.signup_link.click
    app.signup.email.set 'new-user@example.com'
    app.signup.password.set 'password'
    app.signup.password_confirmation.set 'password'
    app.signup.username.set 'new user 1'
    app.signup.rank_normal.set true
    app.signup.address.set 'New York City'
    app.signup.tel.set '01234567891'
    app.signup.gender.select 'female'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set true
    app.signup.submit.click

    expect(app.my_page.header).to have_text('MyPage')
  end

  scenario 'should be an error when blank' do
    app.top.load
    app.top.nav.signup_link.click
    app.signup.email.set ''
    app.signup.password.set ''
    app.signup.password_confirmation.set ''
    app.signup.username.set ''
    app.signup.rank_premium.set true
    app.signup.address.set ''
    app.signup.tel.set ''
    app.signup.gender.select 'I do not answer.'
    app.signup.birthday.set ''
    app.signup.notification.set false
    app.signup.submit.click

    expect(app.signup.email_message).to have_text('Please fill out this field.')
    expect(app.signup.password_message).to have_text('Please fill out this field.')
    expect(app.signup.password_confirmation_message).to have_text('Please fill out this field.')
    expect(app.signup.username_message).to have_text('Please fill out this field.')
    expect(app.signup).to have_no_address_message
    expect(app.signup).to have_no_tel_message
    expect(app.signup).to have_no_gender_message
    expect(app.signup).to have_no_birthday_message
  end

  scenario 'should be an error when invalid value' do
    app.top.load
    app.top.nav.signup_link.click
    app.signup.email.set 'a'
    app.signup.password.set '1234567'
    app.signup.password_confirmation.set '1'
    app.signup.username.set 'tester tester'
    app.signup.rank_normal.set true
    app.signup.address.set 'Chicago, Illinois'
    app.signup.tel.set '1234567890'
    app.signup.gender.select 'other'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set true
    app.signup.submit.click

    expect(app.signup.email_message).to have_text('Please enter a non-empty email address.')
    expect(app.signup.password_message).to have_text('Please lengthen this text to 8 characters or more.')
    expect(app.signup.password_confirmation_message).to have_text('Please lengthen this text to 8 characters or more.')
    expect(app.signup).to have_no_username_message
    expect(app.signup).to have_no_address_message
    expect(app.signup.tel_message).to have_text('Please match the requested format.')
    expect(app.signup).to have_no_gender_message
    expect(app.signup).to have_no_birthday_message
  end

  scenario 'should be an error when email has already been taken' do
    app.top.load
    app.top.nav.signup_link.click
    app.signup.email.set 'new-user@example.com'
    app.signup.password.set 'password'
    app.signup.password_confirmation.set 'password'
    app.signup.username.set 'new user 1'
    app.signup.rank_normal.set true
    app.signup.address.set 'Las Vegas, Nevada'
    app.signup.tel.set '01234567891'
    app.signup.gender.select 'female'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set true
    app.signup.submit.click

    expect(app.signup.email_message).to have_text('Email has already been taken.')
  end

  scenario 'should be an error when password doesn\'t match' do
    app.top.load
    app.top.nav.signup_link.click
    app.signup.email.set 'new-user@example.com'
    app.signup.password.set 'password'
    app.signup.password_confirmation.set '123456789'
    app.signup.username.set 'new user 1'
    app.signup.rank_normal.set true
    app.signup.address.set 'Kansas City, Missouri'
    app.signup.tel.set '01234567891'
    app.signup.gender.select 'female'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set true
    app.signup.submit.click

    expect(app.signup.password_confirmation_message).to have_text('Password doesn\'t match.')
  end
end
