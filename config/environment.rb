# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Photosharing::Application.initialize!

# Initialize pagination
WillPaginate::ViewHelpers.pagination_options[:prev_label] = "< Zurück"
WillPaginate::ViewHelpers.pagination_options[:next_label] = "Vor >"
WillPaginate::ViewHelpers.pagination_options[:inner_window] = 1
WillPaginate::ViewHelpers.pagination_options[:outer_window] = 1