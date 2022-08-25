class LineController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def get_ids(events)
    events.each do |event|
      id = event['source']['userId']
      unless User.exists?(line_id: id)
        client.reply_message(event['replyToken'], { type: 'text', text: 'Please sign up with LINE on www.midorin.one'})
      end
      user = User.find_by(line_id: id)
      return user
      'OK'
    end
  end

  def callback
    skip_authorization

    body = request.body.read
    userid = line_params[:source][:userId]
    linebot = LineBot.new(userid)
    events = linebot.client.parse_events_from(body)
    # user = get_ids(events)

    events.each do |event|
      case event.type
        # when receive a text message
      when Line::Bot::Event::MessageType::Text

        if event.message['text'].downcase.include?('hello')
          response = "Hello"
        else
          response = "I don't understand!"
        end
        message_hash = {
          type: 'text',
          text: response
        }
        linebot.client.reply_message(event['replyToken'], message_hash)
        'OK'
      end
    end
  end

  private

  def line_params
    params.require(:line).require(:events).first.permit(source: :userId)
  end

end
