require "bundler/gem_tasks"

require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = "#{File.dirname(__FILE__)}/test/*_test.rb"
  t.verbose = true
  t.warning = false
end
Rake::Task['test'].comment = "Run mongo i18n tests"
