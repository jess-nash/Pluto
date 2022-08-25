require "json"
require "net/http"
require "uri"
require "tempfile"

class LineBot

  def initialize(line_id)
    @line_id = line_id
  end

  def validate_signature
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end
  end

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
  end

  def send_message(text)
    destination = @line_id
    message = {
      type: 'text',
      text: text
    }
    client.push_message(destination, message)
  end
end
