# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Photosharing::Application.initialize!


ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com",
   :port => 25,
   :domain => "photosharing.com",
   :authentication => :login,
   :user_name => "vampire.photosharing@googlemail.com",
   :password => "hm11sweII",
}
#=======
# Initialize pagination
WillPaginate::ViewHelpers.pagination_options[:prev_label] = "< Zurück"
WillPaginate::ViewHelpers.pagination_options[:next_label] = "Vor >"
WillPaginate::ViewHelpers.pagination_options[:renderer] = 'MinimalPaginationLinkRenderer'