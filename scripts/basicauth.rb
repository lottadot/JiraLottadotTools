require 'rubygems'
require 'pp'
require 'jira'

# https://github.com/sumoheavy/jira-ruby
# https://developer.atlassian.com/display/JIRADEV/JIRA+REST+API+Tutorials
# Consider the use of :use_ssl and :ssl_verify_mode options if running locally 
# for tests.

username = "lottadot"
password = "password"

options = {
            :username => username,
            :password => password,
            :site     => 'http://apoc.local:2990',
            :context_path => '/jira',
            :auth_type => :basic,
            :use_ssl => false,
          }

client = JIRA::Client.new(options)

# Show all projects
projects = client.Project.all

projects.each do |project|
  puts "Project -> key: #{project.key}, name: #{project.name}"
end

project = client.Project.find('TP')

project.issues.each do |issue|
  puts "#{issue.id} - #{issue.summary}"

  pp issue
end
