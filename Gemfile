source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.4.7'

gem "activestorage-scaleway-service"
gem "aws-sdk-s3"
gem "benchmark", "~> 0.5.0" # Removed from bundled gems in Ruby 4.0, needed for delayed_job
gem "bootsnap", require: false
gem "bootstrap"
gem "bootstrap5-kaminari-views"
gem "breadcrumbs_on_rails"
gem "bugsnag"
gem "chartkick"
gem "chunky_png"
gem "delayed_job_active_record"
gem "delayed_job_web"
gem "figaro"
gem "gdpr"
gem "groupdate"
gem "image_processing"
gem "jquery-rails"
gem "jbuilder"
gem "kamifusen"
gem "kaminari"
gem "kaminari-i18n"
gem "ostruct", "~> 0.6" # Removed from bundled gems in Ruby 4.0, needed for simple-navigation
gem "pg", "~> 1.6"
gem "puma", "~> 7.1"
gem "rack-cors"
gem "rails", "~> 8.1"
gem "sassc-rails"
gem "simple-navigation"
gem "simple_form"
gem "simple_form_bs5_file_input"
gem "sprockets-rails"
gem "stability_sdk"
gem "summernote-rails", git: "https://github.com/noesya/summernote-rails.git"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "annotaterb"
  gem "http_logger"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "webdrivers"
end
