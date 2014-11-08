require 'rake'

files = Rake::FileList.new("**/*") do |file|
  file.exclude(/^vim$/) 
  file.exclude(/^vim\/\w$/) 
  file.exclude(/^ssh$/)
  file.exclude("*~*")
  file.exclude(/[A-Z].*/)
  file.exclude("boot*")
  file.exclude("mutt*")
end

dirs = Rake::FileList.new("**/") do |dir|
  dir.exclude("*~*")
end

task :default => :create_symlinks

task :create_dirs do 
  dirs.each do |dir|
    target_directory = dir.pathmap("#{ENV["HOME"]}/.%p")
    mkdir_p target_directory unless Dir.exists?(target_directory)
  end
end

task :create_symlinks => :create_dirs do
  files.each do |file|
    target_location = file.pathmap("#{ENV["HOME"]}/.%p")
    source_location = file.pathmap("#{Dir.pwd}/%p")
    ln_s source_location, target_location unless File.exists?(target_location)
  end
end
