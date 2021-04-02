# rubocop:disable Metrics/MethodLength

require 'telegram_bot'
require_relative 'motivation'
require 'dotenv'
Dotenv.load('.env')

class Bot
  attr_reader :bot, :get_updates

  def initialize
    @bot = TelegramBot.new(ENV['TELEGRAM_API_KEY'])
    @get_updates = update
  end

  private

  def update
    @bot.get_updates(fail_silently: true) do |message|
      puts "@#{message.from.username}: #{message.text}"
      command = message.get_command_for(@bot)

      message.reply do |reply|
        reply.text = case command

                     when '/start', 'hello'
                       "Hello,
           Welcome to Telegram bot, Marijan is responsible for my existance.
           If you wish to serve you please type:
           /start or hello to start my services
           /motivate or motivate  to get motivational quote for today
           /jokes or jokes to make fun from time to time
           /stop or stop  to say GodBye
           /motivation to serve you motivationl quote"
                     when '/motivate', 'motivate'
                       values = Motivation.new
                       value = values.select_random
                       reply.text = (value['text'])
                     when '/jokes', 'jokes'
                       values = Jokes.new
                       value = values.make_an_request
                       reply.text = (value['joke'])
                     when '/stop', 'stop'
                       "Bye, #{message.from.first_name}!"
                     else "I do not understand that, #{message.from.first_name}!,
             thouse are available options to use: /start or hello, /motivate, /jokes, and  /stop,"
                     end
        puts "Sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
      end
    end
  end
end

# rubocop:enable Metrics/MethodLength
