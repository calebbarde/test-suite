aequire 'rake'
require 'rspec/core/rake_task'

desc "Run tests, recording their output"

task default: [:spec]

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = 'spec/**/*_spec.rb'
  task.rspec_opts = '--format Formatters::ZephyrFormatter' +
    ' --require formatters/zephyr_formatter.rb --out logs/zephyr.json'
end
