require 'git'
require 'pry'
require 'json'
require 'net/http'
require 'rspec/core/rake_task'
task :test_changes do
  g = Git.open('./')
  commits = g.log
  commit = commits.first
  diff = commits[1]
  committer = commit.author.email
  diff = g.diff(commit,diff).stats
  folder_diffs = []
  diff[:files].each do |file, data|
    folder_diffs << /^\w[^\/]*/.match(file).to_s
  end
  folder_diffs.uniq.reject(&:empty?).each do |folder|
    unless folder.include?("Rails")
      begin
          RSpec::Core::RakeTask.new(:spec) do |t|
            t.pattern = folder+"/**/spec/*.rb"
            t.fail_on_error = false
            t.rspec_opts = "--format json --out  results.json"
            t.verbose = false
          end
      rescue LoadError
      end
      Rake::Task[:spec].execute
      file = File.read('results.json')
      uri = URI('http://localhost:3000/retrieve_challenge_data')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = JSON.parse(file).merge({committer: committer}).to_json
      http = Net::HTTP.new(uri.host, uri.port)
      res = http.request(req)
    else
      Dir.chdir("./"+folder+"/"+folder[3..-1]) do
        require './config/application'
        Rails.application.load_tasks
        begin
          RSpec::Core::RakeTask.new(:rails_spec) do |t|
            t.pattern ="spec/*.rb"
            t.fail_on_error = false
            t.rspec_opts = "--format json --out  results.json"
            t.verbose = false
          end
        rescue LoadError
        end
        Rake::Task[:rails_spec].execute
      end
      file = File.read("./"+folder+"/"+folder[3..-1]+'/results.json')
      uri = URI('http://localhost:3000/retrieve_challenge_data')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = JSON.parse(file).merge({committer: committer})
      req.body["examples"].each do |example|
        example["id"] = "./"+folder+"/"+folder[3..-1]+example["id"][1..-1]
      end
      req.body = req.body.to_json
      http = Net::HTTP.new(uri.host, uri.port)
      res = http.request(req)
      File.delete("./"+folder+"/"+folder[3..-1]+'/results.json')
    end
  end
end

task :initiate_course do
    folders = Dir.glob("*/").sort
    folders.each do |folder|
      RSpec::Core::RakeTask.new(:spec) do |t|
            t.pattern = folder + "spec/*.rb"
            t.fail_on_error = false
            t.rspec_opts = "--format json --out syllabus.json --exclude-pattern '**/spec/*_helper.rb'"
            t.verbose = false
      end
      Rake::Task[:spec].execute
      file = File.read('syllabus.json')
      uri = URI('http://localhost:3000/initiate_course')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = JSON.parse(file).merge({course_name: File.basename(Dir.getwd)}).to_json
      http = Net::HTTP.new(uri.host, uri.port)
      res = http.request(req)
      end
  end
task :default => [:test_changes]

# Rake::Task["test_changes"].invoke
# Rake::Task["test_changes"].reenable
# Rake::Task["post"].invoke
