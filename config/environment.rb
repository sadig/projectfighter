# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ProjectFighter::Application.initialize!
ActiveRecord::ConnectionAdapters::Mysql2Adapter::NATIVE_DATABASE_TYPES[:primary_key] = "BIGINT UNSIGNED DEFAULT NULL auto_increment PRIMARY KEY"
