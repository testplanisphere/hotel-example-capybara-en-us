# frozen_string_literal: true

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  task default: :spec
rescue LoadError # rubocop:disable Lint/SuppressedException
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError # rubocop:disable Lint/SuppressedException
end
