# frozen_string_literal: true

feature 'Plans' do
  given(:app) { App.new }

  scenario 'should be display plans when not logged in' do
    app.top.load
    app.top.nav.plan_link.click
    app.plans.when_loaded do |page|
      plan_titles = page.plan_titles

      expect(plan_titles.size).to eq(7)
      expect(plan_titles[0]).to have_text('Plan with special offers')
      expect(plan_titles[1]).to have_text('Staying without meals')
      expect(plan_titles[2]).to have_text('Business trip')
      expect(plan_titles[3]).to have_text('With beauty salon')
      expect(plan_titles[4]).to have_text('With private onsen')
      expect(plan_titles[5]).to have_text('For honeymoon')
      expect(plan_titles[6]).to have_text('With complimentary ticket')
    end
  end

  scenario 'should be display plans when logged in member' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'diana@example.com'
    app.login.password.set 'pass1234'
    app.login.submit.click
    app.my_page.nav.plan_link.click
    app.plans.when_loaded do |page|
      plan_titles = page.plan_titles

      expect(plan_titles.size).to eq(9)
      expect(plan_titles[0]).to have_text('Plan with special offers')
      expect(plan_titles[1]).to have_text('With dinner')
      expect(plan_titles[2]).to have_text('Economical')
      expect(plan_titles[3]).to have_text('Staying without meals')
      expect(plan_titles[4]).to have_text('Business trip')
      expect(plan_titles[5]).to have_text('With beauty salon')
      expect(plan_titles[6]).to have_text('With private onsen')
      expect(plan_titles[7]).to have_text('For honeymoon')
      expect(plan_titles[8]).to have_text('With complimentary ticket')
    end
  end

  scenario 'should be display plans when logged in premium member' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'clark@example.com'
    app.login.password.set 'password'
    app.login.submit.click
    app.my_page.nav.plan_link.click
    app.plans.when_loaded do |page|
      plan_titles = page.plan_titles

      expect(plan_titles.size).to eq(10)
      expect(plan_titles[0]).to have_text('Plan with special offers')
      expect(plan_titles[1]).to have_text('Premium plan')
      expect(plan_titles[2]).to have_text('With dinner')
      expect(plan_titles[3]).to have_text('Economical')
      expect(plan_titles[4]).to have_text('Staying without meals')
      expect(plan_titles[5]).to have_text('Business trip')
      expect(plan_titles[6]).to have_text('With beauty salon')
      expect(plan_titles[7]).to have_text('With private onsen')
      expect(plan_titles[8]).to have_text('For honeymoon')
      expect(plan_titles[9]).to have_text('With complimentary ticket')
    end
  end
end
