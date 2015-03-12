require 'rails_helper'


RSpec.configure do |config|

  config.include Rails.application.routes.url_helpers


  config.expect_with :rspec do |expectations|

   expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|

   mocks.verify_partial_doubles = true
  end


end
