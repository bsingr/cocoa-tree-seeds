require 'pstore'
require 'dropbox_sdk'

DROPBOX_TOKEN = ENV['DROPBOX_TOKEN']
LOCAL_FILE = "db/#{Rails.env}.pstore"
REMOTE_FILE = "/#{Rails.env}.pstore"
DB = {}

def reload_store
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

  file = PStore.new(LOCAL_FILE)
  file.transaction do
    file.roots.each { |k| DB[k] = file[k] }
  end
end

reload_store

at_exit do
  file = PStore.new(LOCAL_FILE)
  file.transaction do
    DB.each { |k,v| file[k] = v }
  end

  if DROPBOX_TOKEN
    client = DropboxClient.new(DROPBOX_TOKEN)
    response = client.put_file(REMOTE_FILE, open(LOCAL_FILE, 'rb'), true)
    puts "uploaded:", response.inspect
  end
end
