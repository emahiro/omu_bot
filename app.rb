require "sinatra"
require "sinatra/reloader" if development?
require "line/bot"

# check Sinatra active
get '/' do
  "Hello World"
end

# LINE bot callback
def client
  @client ||= Line::Bot::Client.new { |config|
<<<<<<< HEAD
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
=======
    config.channel_secret = "channel_secretを入力"
    config.channel_token = "channel_tokenを入力"
>>>>>>> origin/master
  }
end

post '/callback' do
  body = request.body.read

  signature = request.env['HTTP_X_LINE_SIGNATURE']
  unless client.validate_signature(body, signature)
    error 400 do 'Bad Request' end
  end

  events = client.parse_events_from(body)

  events.each { |event|
    case event
    when Line::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text

        message = {
          type: 'text',
          text: event.message['text']
        }

        client.reply_message(event['replyToken'], message)
      end
    end
  }

  "OK"
end
