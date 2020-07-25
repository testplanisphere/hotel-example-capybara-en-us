# frozen_string_literal: true

feature 'Reservation' do
  given(:app) { App.new }

  scenario 'should be display initial values [not logged in]' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Plan with special offers' }.find('a').click
      end
    end
    within_window reserve_window do
      tomorrow = Date.today.next_day.strftime('%m/%d/%Y')
      expect(app.reserve.plan_name).to have_text('Plan with special offers')
      expect(app.reserve.reserve_date.value).to eq(tomorrow)
      expect(app.reserve.reserve_term.value).to eq('1')
      expect(app.reserve.head_count.value).to eq('1')
      expect(app.reserve).to have_no_email
      expect(app.reserve).to have_no_tel
      app.reserve.contact.select 'By email'
      expect(app.reserve).to have_email
      expect(app.reserve).to have_no_tel
      expect(app.reserve.email.value).to be_empty
      app.reserve.contact.select 'By telephone'
      expect(app.reserve).to have_no_email
      expect(app.reserve).to have_tel
      expect(app.reserve.tel.value).to be_empty
      app.reserve.room_frame do |frame|
        expect(frame.header).to have_text('Standard Twin')
      end
    end
  end

  scenario 'should be display initial values [logged in]' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'clark@example.com'
    app.login.password.set 'password'
    app.login.submit.click
    app.my_page.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Premium plan' }.find('a').click
      end
    end
    within_window reserve_window do
      tomorrow = Date.today.next_day.strftime('%m/%d/%Y')
      expect(app.reserve.plan_name).to have_text('Premium plan')
      expect(app.reserve.reserve_date.value).to eq(tomorrow)
      expect(app.reserve.reserve_term.value).to eq('1')
      expect(app.reserve.head_count.value).to eq('2')
      expect(app.reserve.username.value).to eq('Clark Evans')
      expect(app.reserve).to have_no_email
      expect(app.reserve).to have_no_tel
      app.reserve.contact.select 'By email'
      expect(app.reserve).to have_email
      expect(app.reserve).to have_no_tel
      expect(app.reserve.email.value).to eq('clark@example.com')
      app.reserve.contact.select 'By telephone'
      expect(app.reserve).to have_no_email
      expect(app.reserve).to have_tel
      expect(app.reserve.tel.value).to eq('01234567891')
      app.reserve.room_frame do |frame|
        expect(frame.header).to have_text('Premium Twin')
      end
    end
  end

  scenario 'should be an error when blank values' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Plan with special offers' }.find('a').click
      end
    end
    within_window reserve_window do
      sleep 1
      app.reserve.reserve_date.set ''
      sleep 1
      app.reserve.date_picker_close.click
      app.reserve.reserve_term.set ''
      app.reserve.head_count.set ''
      app.reserve.username.set 'the tester'  # move focus

      expect(app.reserve.reserve_date_message).to have_text('Please fill out this field.')
      expect(app.reserve.reserve_term_message).to have_text('Please fill out this field.')
      expect(app.reserve.head_count_message).to have_text('Please fill out this field.')
    end
  end

  scenario 'should be an error when invalid values [under]' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Plan with special offers' }.find('a').click
      end
    end
    within_window reserve_window do
      today = Date.today.strftime('%m/%d/%Y')
      app.reserve.reserve_date.set ''
      sleep 1
      app.reserve.reserve_date.set today
      app.reserve.date_picker_close.click
      app.reserve.reserve_term.set '0'
      app.reserve.head_count.set '0'
      app.reserve.username.set 'the tester'  # move focus

      expect(app.reserve.reserve_date_message).to have_text('Please enter a date after tomorrow.')
      expect(app.reserve.reserve_term_message).to have_text('Value must be greater than or equal to 1.')
      expect(app.reserve.head_count_message).to have_text('Value must be greater than or equal to 1.')
    end
  end

  scenario 'should be an error when invalid values [over]' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Plan with special offers' }.find('a').click
      end
    end
    within_window reserve_window do
      after90 = Date.today.next_day(91).strftime('%m/%d/%Y')
      app.reserve.reserve_date.set ''
      sleep 1
      app.reserve.reserve_date.set after90
      app.reserve.date_picker_close.click
      app.reserve.reserve_term.set '10'
      app.reserve.head_count.set '10'
      app.reserve.username.set 'the tester'  # move focus

      expect(app.reserve.reserve_date_message).to have_text('Please enter a date within 3 months.')
      expect(app.reserve.reserve_term_message).to have_text('Value must be less than or equal to 9.')
      expect(app.reserve.head_count_message).to have_text('Value must be less than or equal to 9.')
    end
  end

  scenario 'should be an error when invalid values [string]' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Plan with special offers' }.find('a').click
      end
    end
    within_window reserve_window do
      app.reserve.reserve_date.set ''
      sleep 1
      app.reserve.reserve_date.set '12/3//345'
      app.reserve.date_picker_close.click
      app.reserve.reserve_term.set 'a' # cannot input
      app.reserve.head_count.set 'a' # cannnot input
      app.reserve.username.set 'the tester' # move focus

      expect(app.reserve.reserve_date_message).to have_text('Please enter a valid value.')
      expect(app.reserve.reserve_term_message).to have_text('Please fill out this field.')
      expect(app.reserve.head_count_message).to have_text('Please fill out this field.')
    end
  end

  scenario 'should be an error when submitting [mail]' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Plan with special offers' }.find('a').click
      end
    end
    within_window reserve_window do
      app.reserve.username.set ''
      app.reserve.contact.select 'By email'
      app.reserve.email.set ''
      app.reserve.submit.click

      expect(app.reserve.username_message).to have_text('Please fill out this field.')
      expect(app.reserve.email_message).to have_text('Please fill out this field.')
    end
  end

  scenario 'should be an error when submitting [tel]' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Plan with special offers' }.find('a').click
      end
    end
    within_window reserve_window do
      app.reserve.username.set ''
      app.reserve.contact.select 'By telephone'
      app.reserve.tel.set ''
      app.reserve.submit.click

      expect(app.reserve.username_message).to have_text('Please fill out this field.')
      expect(app.reserve.tel_message).to have_text('Please fill out this field.')
    end
  end

  scenario 'should be successful the reservation [not logged in] [initial values]' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Plan with special offers' }.find('a').click
      end
    end
    within_window reserve_window do
      expected_start = Date.today.next_day
      expected_end = Date.today.next_day(2)
      expected_total_bill = if expected_start.sunday? || expected_start.saturday?
                              'Total $87.50 (included taxes)'
                            else
                              'Total $70.00 (included taxes)'
                            end
      expected_term = "#{expected_start.strftime('%B %-d, %Y')} - #{expected_end.strftime('%B %-d, %Y')}. 1 night(s)"

      app.reserve.username.set 'the tester'
      app.reserve.contact.select 'I don\'t need.'
      app.reserve.submit.click

      expect(app.confirm.total_bill).to have_text(expected_total_bill)
      expect(app.confirm.plan_name).to have_text('Plan with special offers')
      expect(app.confirm.term).to have_text(expected_term)
      expect(app.confirm.head_count).to have_text('1 person(s)')
      expect(app.confirm.plans).to have_text('none')
      expect(app.confirm.username).to have_text('the tester')
      expect(app.confirm.contact).to have_text('not required')
      expect(app.confirm.comment).to have_text('none')

      app.confirm.confirm.click
      app.confirm.wait_until_success_modal_visible
      expect(app.confirm.modal_message).to have_text('We look forward to visiting you.')
      sleep 1
      win = current_window
      app.confirm.close.click
      expect(win).to become_closed
    end
  end

  scenario 'should be successful the reservation [logged in]' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'clark@example.com'
    app.login.password.set 'password'
    app.login.submit.click
    app.my_page.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'Premium plan' }.find('a').click
      end
    end
    within_window reserve_window do
      expected_start = Date.today.next_day(90)
      expected_end = Date.today.next_day(92)
      expected_total_bill = if expected_start.saturday?
                              'Total $1,120.00 (included taxes)'
                            elsif expected_start.sunday? || expected_start.friday?
                              'Total $1,020.00 (included taxes)'
                            else
                              'Total $920.00 (included taxes)'
                            end
      expected_term = "#{expected_start.strftime('%B %-d, %Y')} - #{expected_end.strftime('%B %-d, %Y')}. 2 night(s)"

      app.reserve.reserve_term.set ''
      app.reserve.reserve_term.set '2'
      app.reserve.head_count.set ''
      app.reserve.head_count.set '4'
      app.reserve.breakfast_plan.set true
      app.reserve.early_check_in_plan.set true
      app.reserve.sightseeing_plan.set false
      app.reserve.contact.select 'By email'
      app.reserve.comment.set "aaa\n\nbbbbbbb\ncc"
      app.reserve.reserve_date.set expected_start.strftime('%m/%d/%Y')
      app.reserve.date_picker_close.click
      app.reserve.submit.click

      expect(app.confirm.total_bill).to have_text(expected_total_bill)
      expect(app.confirm.plan_name).to have_text('Premium plan')
      expect(app.confirm.term).to have_text(expected_term)
      expect(app.confirm.head_count).to have_text('4 person(s)')
      expect(app.confirm.plans.text).to include('Breakfast')
      expect(app.confirm.plans.text).to include('Early check-in')
      expect(app.confirm.plans.text).not_to include('Sightseeing')
      expect(app.confirm.username).to have_text('Clark Evans')
      expect(app.confirm.contact).to have_text('Email: clark@example.com')
      expect(app.confirm.comment).to have_text("aaa\n\nbbbbbbb\ncc")

      app.confirm.confirm.click
      app.confirm.wait_until_success_modal_visible
      expect(app.confirm.modal_message).to have_text('We look forward to visiting you.')
      sleep 1
      win = current_window
      app.confirm.close.click
      expect(win).to become_closed
    end
  end
end
