require 'dropbox_sdk'

DROPBOX_TOKEN = ENV['DROPBOX_TOKEN']
LOCAL_FILE = "db/#{Rails.env}.pstore"
REMOTE_FILE = "/#{Rails.env}.pstore"
if DROPBOX_TOKEN
  client = DropboxClient.new(DROPBOX_TOKEN)
  puts "linked account:", client.account_info().inspect
  begin
    contents, metadata = client.get_file_and_metadata(REMOTE_FILE)
    open(LOCAL_FILE, 'wb') {|f| f.puts contents }
  rescue => e
    puts e
  end
end

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

  if DROPBOX_TOKEN
    client = DropboxClient.new(DROPBOX_TOKEN)
    response = client.put_file(REMOTE_FILE, open(LOCAL_FILE, 'rb'), true)
    puts "uploaded:", response.inspect
  end
end
