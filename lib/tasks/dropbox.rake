require 'dropbox_sdk'

DROPBOX_TOKEN = ENV['DROPBOX_TOKEN']
LOCAL_FILE = 'db/production.pstore'
REMOTE_FILE = '/production.pstore'

namespace :dropbox do
  task :load do
    client = DropboxClient.new(DROPBOX_TOKEN)
    puts "linked account:", client.account_info().inspect
    begin
      contents, metadata = client.get_file_and_metadata(REMOTE_FILE)
      open(LOCAL_FILE, 'wb') {|f| f.puts contents }
    rescue => e
      puts e
    end
  end

  task :store do
    client = DropboxClient.new(DROPBOX_TOKEN)
    puts "linked account:", client.account_info().inspect
    response = client.put_file(REMOTE_FILE, open(LOCAL_FILE, 'rb'), true)
    puts "uploaded:", response.inspect
  end
end
