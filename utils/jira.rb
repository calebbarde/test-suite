require 'jira-ruby'
#QA Reviewer = customfield_11025

class Jira
  Issue = Struct.new(:key, :summary, :reviewer, :labels)

  def self.get_issues(issues)
    new.get_issues(issues)
  end

  def get_issues(issues)
    query = "issue in (#{issues.join(",")})"
    client.Issue.jql(query).map do |issue|
      issue_to_recurly_issue(issue)
    end
  end

  private

  def issue_to_recurly_issue(issue)
    Issue.new(
      issue.key,
      issue.summary,
      issue.customfield_11025["name"],
      issue.labels
    )
  end

  def client
    @client ||= JIRA::Client.new(
      username: ENV['JIRA_USERNAME'],
      password: ENV['JIRA_PASSWORD'],
      site: ENV['JIRA_SITE'],
      context_path: '',
      auth_type: :basic
    )
  end
end
