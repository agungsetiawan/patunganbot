Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Patunganbot"

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  # config.robot.adapter = :shell
   config.robot.adapter = :telegram_plus
   config.adapters.telegram_plus.token = ''

  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  ## Example: Set options for the Redis connection.
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 1234

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"
  
  require 'active_record'

  ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    host: 'localhost',
    database: '',
    username: '',
    password: ''
  )

  require_relative './handlers/base_handler'
  require_relative './handlers/register_handler'
  require_relative './handlers/join_handler'
  require_relative './handlers/participant_handler'
  require_relative './handlers/info_handler'
  require_relative './handlers/pay_handler'
  require_relative './handlers/help_handler'
  require_relative './handlers/finish_handler'
  require_relative './handlers/payment_info_handler'
  require_relative './handlers/note_handler'
  require_relative './models/course'
  require_relative './models/participant'
  require_relative './services/get_current_course'
end
