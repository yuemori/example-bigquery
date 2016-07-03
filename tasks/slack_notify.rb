require 'bundler/setup'
require 'slack-notifier'

module Task
  class SlackNotify
    def slack_notify(command:, channel:, username: 'bot-test')
      webhook_url = Digdag.env.params['webhook_url']
      result = `#{command}`
      notifier = Slack::Notifier.new webhook_url, channel: channel, username: username
      notifier.ping result
    end
  end
end
