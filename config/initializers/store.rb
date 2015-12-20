require 'pstore'

DB = PStore.new("db/#{Rails.env}.pstore")
