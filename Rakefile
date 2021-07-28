require 'rake/testtask'

namespace :ami_mwi_history do
  namespace :test do
    Rake::TestTask.new(:run) do |t|
      t.test_files = FileList['./test/*_test.rb']
      t.verbose = false
    end
  end
end
