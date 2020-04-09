#!/usr/bin/ruby

require "discordrb"
load "../aux/heredocs.rb"
load "../config.rb"

init_time = Time.now.to_i 
dnbot = Discordrb::Bot.new(
  token: TOKEN,
  client_id: ID
)

command_handler = Discordrb::Commands::CommandBot.new(
  token: TOKEN,
  prefix: PREFIX
)

command_handler.command(:covidstats) do |event|
  country_code = event.content.split[1]
  event.respond("```" + `curl -s https://corona-stats.online/#{country_code}?minimal=true | sed 's/\x1b\[[0-9;]*m//g' | head -3` + "```")
end

command_handler.command(:roll) do |event|
  event.respond("You rolled a #{rand(1..6)}")
end

command_handler.command(:flip) do |event|
  event.respond(rand(10) < 5 ? "heads" : "tails")
end

command_handler.command(:ask) do |event|
  event.respond($ask_paste)
end

command_handler.command(:hackerman) do |event|
  event.message.delete
  event.respond($hackerman_paste)
end

command_handler.command(:zoomer) do |event|
  if event.author.highest_role.name =~ ADMIN_ROLES
    event.message.mentions.each do |user|
      user.on(event.server)&.add_role(638446972227026954)
    end
  else
    event.respond("I'm sorry #{event.author.name}, I'm afraid I can't do that.")
  end
  nil
end

command_handler.command(:remindme) do |event|
  arg_array = event.content.split

  if arg_array[1].respond_to?(:to_i) && arg_array[2] =~ /(seconds|minutes|hours)/
    Thread.new {
      sleep arg_array[1].to_i * (
        case arg_array[2]
          when "seconds" then 1
          when "minutes" then 60
          when "hours"   then 3600
        end
      )
      event.respond(
        "#{event.user.mention}" +
        "You requested a reminder #{arg_array[1]} #{arg_array[2]} ago:\n" + 
        "https://discordapp.com/channels/#{event.server.id}/#{event.channel.id}/#{event.message.id}"
      )
    }.join
  else
    event.respond("Invalid arguments, see ;help output")
  end
  nil
end

command_handler.command(:ping) do |event|
  event.channel.start_typing
  event.respond("I can't be bothered to implement a safe ;ping")
=begin
  arg_array = event.content.split

  event.respond(
    arg_array.length > 1 ?
      arg_array[1] =~ /([0-9]{1,3}\.){3}[0-9]{1,3}/ ?
        "```sh\n#{`ping -w 3 #{arg_array[1]}`}\n```"
      :
        "```sh\ninvalid\n```"
    :
      "```sh\n#{`ping -w 3 1.1.1.1`}\n```"
  )
=end
  nil
end

command_handler.command(:time) do |event|
  event.channel.start_typing
  event.respond("```\n#{Time.now}\n```")
end

command_handler.command(:uptime) do |event|
  event.channel.start_typing
  current = Time.now.to_i - init_time
  event.respond("```\n#{BOT_NAME} has been online for #{current / 60 / 60} hours, #{((current / 60) % 60)} minutes\n```")
end

command_handler.command(:echo) do |event|
  event.message.delete
  event.channel.start_typing
  event.respond(event.content[5..-1])
end

command_handler.command(:sysuptime) do |event|
  event.channel.start_typing
  event.respond("```\n#{`uptime`}\n```")
end

command_handler.command(:help) do |event|
  event.channel.start_typing
  event.respond($help_msg)
end

command_handler.command(:purge) do |event|
  event.channel.start_typing
  if event.author.highest_role.name =~ ADMIN_ROLES
    arg_array = event.content.split
    event.channel.history(arg_array.length > 1 ? arg_array[1].to_i + 1 : 10).each do |message|
         message.delete
    end
    event.respond("#{arg_array[1]} messages deleted!")
  else
    event.respond("I'm sorry #{event.author.name}, I'm afraid I can't do that.")
  end
end

command_handler.command(:roles) do |event|
  event.channel.start_typing
  arg_array = event.content.split
  event.respond($roles) if arg_array.length == 1

  message = ""
  arg_array.each do |arg|
    event.server.roles.each do |role|
      if arg.downcase == role.name.downcase
        case arg_array[1]
          when "add"
            event.user.add_role(role.id)
          when "remove"
            event.user.remove_role(role.id)
        end
        message += role.name + ' '
      end
    end
  end

  case arg_array[1]
    when "add"
      event.respond("roles added: #{message}")
    when "remove"
      event.respond("roles removed: #{message}")
  end
  nil
end

command_handler.command(:poll) do |event|
  arg_array = event.content.split
  if arg_array.length <3 # uwu
    event.respond("you must supply at least 2 options")
    break
  end

  load("../aux/integer_overload.rb")
  event.message.delete
  dnbot_message = event.respond(event.content[5..-1])
  (arg_array.length - 1).times do |n|
    dnbot_message.react(n.to_reaction_monkey_edition)
  end

  nil
end

command_handler.command(:vote) do |event|
  event.message.delete
  dnbot_message = event.respond(event.content[5..-1])
  dnbot_message.react(VOTE_YES_EMOJI)
  dnbot_message.react(VOTE_NO_EMOJI)
end

command_handler.command(:kick) do |event|
  event.channel.start_typing
  if event.author.highest_role.name =~ ADMIN_ROLES
    event.message.mentions.each do |user|
      event.server.kick(user)
    end
    event.respond("user was kicked")
  else
    event.respond("I'm sorry #{event.author.name}, I'm afraid I can't do that.")
  end
end

command_handler.command(:ban) do |event|
  event.channel.start_typing
  if event.author.highest_role.name =~ ADMIN_ROLES
    event.message.mentions.each do |user|
      event.server.ban(user)
      event.respond("user was banned")
    end
  else
    event.respond("I'm sorry #{event.author.name}, I'm afraid I can't do that.")
  end
  nil
end

command_handler.command(:mute) do |event|
  if event.author.highest_role.name =~ ADMIN_ROLES
    event.message.mentions.each do |user|
      user.on(event.server)&.add_role(MUTE_ROLE_ID)
    end
    event.respond("#{user.name} was muted")
  else
    event.respond("I'm sorry #{event.author.name}, I'm afraid I can't do that.")
  end
end

command_handler.command(:unmute) do |event|
  if event.author.highest_role.name =~ ADMIN_ROLES
    event.message.mentions.each do |user|
      user.on(event.server)&.remove_role(MUTE_ROLE_ID)
    end
    event.respond("unmuted")
  else
    event.respond("I'm sorry #{event.author.name}, I'm afraid I can't do that.")
  end
end

command_handler.command(:kill) do |event|
  if event.author.highest_role.name =~ ADMIN_ROLES
    event.respond("goodbye")
    exit 1
  else
    event.respond("I'm sorry #{event.author.name}, I'm afraid I can't do that.")
  end
end

command_handler.member_join do |event|
  event.user.add_role(DEFAULT_ROLE_ID) if DEFAULT_ROLE
  dnbot
    .channel(JOIN_MSG_CHAN_ID)
    .send(
      "#{event.user.mention}" +
      "Welcome to #{SERVER_NAME} - you are member \##{
        event.server.member_count -
        event.server.members.select(&:bot_account?).length
      }\n" + 
      "send `;roles` to see roles\n" +
      "send `;help` to get help"
    )
end

command_handler.ready {
  string = "this text scroll "
  loop do
    c = string[0]

    i = 0
    while i < string.length - 1
      string[i] = string[i + 1]
      i += 1
    end

    string[-1] = c

    command_handler.update_status("online", string, nil, 0, false, 3)
    sleep 1
  end
}

command_handler.run
