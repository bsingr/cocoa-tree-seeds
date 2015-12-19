require 'dropbox_sdk'

DROPBOX_TOKEN = ENV['DROPBOX_TOKEN']
LOCAL_FILE = 'db/development.sqlite3'
REMOTE_FILE = '/development.sqlite3'

namespace :dropbox do
  task :load do
    client = DropboxClient.new(DROPBOX_TOKEN)
    puts "linked account:", client.account_info().inspect
    contents, metadata = client.get_file_and_metadata(REMOTE_FILE)
    open(LOCAL_FILE, 'wb') {|f| f.puts contents }
  end

  task :store do
    client = DropboxClient.new(DROPBOX_TOKEN)
    puts "linked account:", client.account_info().inspect
    response = client.put_file(REMOTE_FILE, open(LOCAL_FILE, 'rb'), true)
    puts "uploaded:", response.inspect
  end
end
