require_relative 'jira'
require 'pry-byebug'

class ZephyrUpdater
  def self.run(test_json)
    test_results = JSON.parse(test_json)
    # get metadata off jira issues
    issues = related_recurly_issues(test_results: test_results)
    # find test cases without related zephyr issues

    card_ids = test_results.map { |result| result["card"] }

    puts issues.inspect


    # create test cases in the latest release
    # create test repositories for those labels
    # update executions for all tests
  end

  def self.related_recurly_issues(test_results:)
    cards = test_results.map { |result| result["card"] }

    Jira.get_issues(cards)
  end
end

ZephyrUpdater.run(File.open('logs/zephyr.json').read)
