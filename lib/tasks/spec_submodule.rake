desc 'Update Specs folder'
task :spec_submodule do
	system 'git clone git@github.com:CocoaPods/Specs.git'
end
