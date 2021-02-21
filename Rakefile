# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

require 'rake/testtask'

Rake::TestTask.new do |t| 
  t.libs << "tests" # adds the tests directory to the lists of directories in the #$LOADPATH 
  t.test_files = FileList["tests/test*.rb"]
  #creates a list of files that match “tests/test*.rb” 
  t.verbose = true 
  # if you want your tests to output what they should do, then set this to true.
end

Rails.application.load_tasks
