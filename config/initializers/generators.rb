Rails.application.config.generators do |g|
  g.test_framework :rspec, :fixture => false, :views => false, :helpers => false
end

