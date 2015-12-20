require 'pstore'

DB_FILE = PStore.new("db/#{Rails.env}.pstore")

DB = {}

DB_FILE.transaction do
  DB_FILE.roots.each { |k| DB[k] = DB_FILE[k] }
end

at_exit do
  DB_FILE.transaction do
    DB.each { |k,v| DB_FILE[k] = v }
  end
end
