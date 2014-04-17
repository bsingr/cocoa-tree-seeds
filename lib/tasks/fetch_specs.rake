desc 'Update Specs folder'
task :fetch_specs do
	cmd = []
	cmd << 'curl -L https://github.com/CocoaPods/Specs/archive/master.zip > master.zip'
	cmd << 'jar xf master.zip'
	cmd << 'mv Specs-master Specs'
	system cmd.join(' && ')
end
