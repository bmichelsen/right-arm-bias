require 'rubygems'

# datamapper
%w( dm-core dm-aggregates dm-validations ).each { |f| require f }

%w( pattern movement tag ).each do |model|
  load "#{Dir.pwd}/models/#{model}.rb"
end

# database setup
DataMapper.setup(:default, "sqlite3:///#{Dir.pwd}/db.sqlite3")
 
