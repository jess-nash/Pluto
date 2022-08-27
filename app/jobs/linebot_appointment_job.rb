class LinebotAppointmentJob < ApplicationJob
  queue_as :default

  #  def perform(user)
  #    destination = user.line_id
  #    return unless destination
  #    linebot = LineBot.new(destination)
  #    message_text = "message from the job!!"
  #    message = {
  #      type: 'text',
  #      text: message_text
  #    }
  #    linebot.client.push_message(destination, message)
  #  end

  def perform
    User.all.each do |user|
      user.send_line_message
    end
  end
end
