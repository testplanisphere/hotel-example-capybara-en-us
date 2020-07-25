# frozen_string_literal: true

feature 'MyPage' do
  given(:app) { App.new }

  scenario 'should be display preset user [clark]' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'clark@example.com'
    app.login.password.set 'password'
    app.login.submit.click

    expect(app.my_page.email).to have_text('clark@example.com')
    expect(app.my_page.username).to have_text('Clark Evans')
    expect(app.my_page.rank).to have_text('Premium')
    expect(app.my_page.address).to have_text('Mountain View, California')
    expect(app.my_page.tel).to have_text('01234567891')
    expect(app.my_page.gender).to have_text('male')
    expect(app.my_page.birthday).to have_text('not answered')
    expect(app.my_page.notification).to have_text('received')
  end

  scenario 'should be display preset user [diana]' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'diana@example.com'
    app.login.password.set 'pass1234'
    app.login.submit.click

    expect(app.my_page.email).to have_text('diana@example.com')
    expect(app.my_page.username).to have_text('Diana Johansson')
    expect(app.my_page.rank).to have_text('Normal')
    expect(app.my_page.address).to have_text('Redmond, Washington')
    expect(app.my_page.tel).to have_text('not answered')
    expect(app.my_page.gender).to have_text('female')
    expect(app.my_page.birthday).to have_text('April 1, 2000')
    expect(app.my_page.notification).to have_text('not received')
  end

  scenario 'should be display preset user [ororo]' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'ororo@example.com'
    app.login.password.set 'pa55w0rd!'
    app.login.submit.click

    expect(app.my_page.email).to have_text('ororo@example.com')
    expect(app.my_page.username).to have_text('Ororo Saldana')
    expect(app.my_page.rank).to have_text('Premium')
    expect(app.my_page.address).to have_text('Cupertino, California')
    expect(app.my_page.tel).to have_text('01212341234')
    expect(app.my_page.gender).to have_text('other')
    expect(app.my_page.birthday).to have_text('December 17, 1988')
    expect(app.my_page.notification).to have_text('not received')
  end

  scenario 'should be display preset user [miles]' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'miles@example.com'
    app.login.password.set 'pass-pass'
    app.login.submit.click

    expect(app.my_page.email).to have_text('miles@example.com')
    expect(app.my_page.username).to have_text('Miles Boseman')
    expect(app.my_page.rank).to have_text('Normal')
    expect(app.my_page.address).to have_text('not answered')
    expect(app.my_page.tel).to have_text('01298765432')
    expect(app.my_page.gender).to have_text('not answered')
    expect(app.my_page.birthday).to have_text('August 31, 1992')
    expect(app.my_page.notification).to have_text('received')
  end

  scenario 'should be display new user' do
    app.top.load
    app.top.nav.signup_link.click
    app.signup.email.set 'new-user@example.com'
    app.signup.password.set '11111111'
    app.signup.password_confirmation.set '11111111'
    app.signup.username.set 'Jane Doe'
    app.signup.rank_normal.set true
    app.signup.address.set 'Detroit, Michigan'
    app.signup.tel.set '09876543211'
    app.signup.gender.select 'female'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set false
    app.signup.submit.click

    expect(app.my_page.email).to have_text('new-user@example.com')
    expect(app.my_page.username).to have_text('Jane Doe')
    expect(app.my_page.rank).to have_text('Normal')
    expect(app.my_page.address).to have_text('Detroit, Michigan')
    expect(app.my_page.tel).to have_text('09876543211')
    expect(app.my_page.gender).to have_text('female')
    expect(app.my_page.birthday).to have_text('January 1, 2000')
    expect(app.my_page.notification).to have_text('not received')
  end

  scenario 'should be an error selecting not image on icon setting' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'new-user@example.com'
    app.login.password.set '11111111'
    app.login.submit.click
    app.my_page.icon_link.click
    file_path = Pathname(__FILE__).expand_path + '..' + 'uploadfiles' + 'dummy.txt'
    app.icon.icon.set file_path.to_s

    expect(app.icon.icon_message).to have_text('Please select an image file.')
  end

  scenario 'should be an error selecting over 10KB file on icon setting' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'new-user@example.com'
    app.login.password.set '11111111'
    app.login.submit.click
    app.my_page.icon_link.click
    file_path = Pathname(__FILE__).expand_path + '..' + 'uploadfiles' + '240x240_12.png'
    app.icon.icon.set file_path.to_s

    expect(app.icon.icon_message).to have_text('Please select a file with a size of 10 KB or less.')
  end

  scenario 'should be display icon image' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'new-user@example.com'
    app.login.password.set '11111111'
    app.login.submit.click
    app.my_page.icon_link.click
    file_path = Pathname(__FILE__).expand_path + '..' + 'uploadfiles' + '240x240_01.png'
    app.icon.icon.set file_path.to_s
    app.icon.zoom.set 80
    app.icon.color.set '#000000'
    app.icon.submit.click

    expect(app.my_page).to have_icon_image
    expect(app.my_page.icon_image[:width]).to eq('70')
    expect(app.my_page.icon_image).to match_style(backgroundColor: 'rgba(0, 0, 0, 1)')
  end

  scenario 'should delete new user' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'new-user@example.com'
    app.login.password.set '11111111'
    app.login.submit.click

    confirm_message = accept_confirm do
      alert_message = accept_alert do
        app.my_page.delete.click
      end
      expect(alert_message).to eq("If you cancel your membership, all information will be deleted.\nDo you wish to proceed?")
    end

    expect(confirm_message).to eq('The process has been completed. Thank you for your service.')
    expect(current_url).to include('index.html')
  end
end
