require "telegram/bot"
require 'dotenv'
Dotenv.load('.env')

class Bot
  api_key = ENV['TELEGRAM_API_KEY']
  Telegram::Bot::Client.run(api_key) do |bot|
    bot.listen do |message|
      #  p message.text
      case message.text
      when "/start"
        bot.api.send_message(chat_id: message.chat.id,
                             text: "Hello, #{message.from.first_name}, Use /start to start bot, /stop to exit bot. ")
      when "/stop"
        bot.api.send_message(chat_id: message.chat.id, text: "GodBuy, #{message.from.first_name}, date: #{message.date}")
      end
    end
  end
end
