#!/usr/bin/ruby

init_time = Time.now.to_i

=begin
  TODO:
    ;unban
    ;countdown n
    ;tstart
    ;tstop
    ;ddg query
    ;rem reminder
    ;ffmpeg
    ;gcc - sanitise input
    ;ruby - ditto
    ;man
    ;imagemagick
=end

require("discordrb")
#require("yt")
load("../aux/heredocs.rb")

dnbot = Discordrb::Bot.new(
  token: ENV["DNTOKEN"],
  client_id: ENV["DNID"].to_i
)

command_handler = Discordrb::Commands::CommandBot.new(
  token: ENV["DNTOKEN"],
  prefix: ';'
)

=begin
Yt.configure do |config|
  config.api_key = ENV["YTAPIKEY"]
end

Thread.new {
  numberphile = Yt::Channel.new id: "UCoxcjq-8xIDTYp3uz647V5A"
  computerphile = Yt::Channel.new id: "UC9-y-6csu5WGm29I7JiwpnA"

  numberphile_lvc = numberphile.video_count
  computerphile_lvc = computerphile.video_count

  loop do
    # sleep(1800)

    if numberphile.video_count > numberphile_lvc
      dnbot
        .channel(661703261534945309)
        .send("new numberphile upload:\nhttps://www.youtube.com/watch?v=#{numberphile.videos.where(order: "date").first.id}")
    elsif computerphile.video_count > computerphile_lvc
      dnbot
        .channel(546321193117155328)
        .send("new computerphile upload:\nhttps://www.youtube.com/watch?v=#{computerphile.videos.where(order: "date").first.id}")
    end

    # set every iteration in case video_count decreases
    numberphile_lvc = computerphile.video_count
    computerphile_lvc = computerphile.video_count
  end
}.join
=end

command_handler.command(:ping) do |event|
  event.channel.start_typing()
  arg_array = event.content.split()

  event.respond(
    arg_array.length > 1 ?
      arg_array[1] =~ /([0-9]{1,3}\.){3}[0-9]{1,3}/ ?
        "```sh\n#{`ping -w 3 #{arg_array[1]}`}\n```"
      :
        "```sh\ninvalid\n```"
    :
      "```sh\n#{`ping -w 3 1.1.1.1`}\n```"
  )
end

command_handler.command(:time) do |event|
  event.channel.start_typing()
  event.respond("```\n#{Time.now}\n```")
end

command_handler.command(:uptime) do |event|
  event.channel.start_typing()
  current = Time.now.to_i - init_time
  event.respond("```\n/dev/null has been online for #{current / 60 / 60} hours, #{((current / 60) % 60)} minutes\n```")
end

command_handler.command(:echo) do |event|
  event.message.delete()
  event.channel.start_typing()
  event.respond(event.content[5..-1])
end

command_handler.command(:sysuptime) do |event|
  event.channel.start_typing()
  event.respond("```\n#{`uptime`}\n```")
end

command_handler.command(:help) do |event|
  event.channel.start_typing()
  event.respond($help_msg)
end

command_handler.command(:purge) do |event|
  event.channel.start_typing()
  if event.author.highest_role.name =~ /(wheel|root)/
    arg_array = event.content.split()
    event.channel.history(arg_array.length > 1 ? arg_array[1].to_i + 1 : 10).each do |message|
         message.delete()
    end
    event.respond("#{arg_array[1]} messages deleted!")
  else
    event.respond("only root can do that")
  end
end

command_handler.command(:roles) do |event|
  event.channel.start_typing()
  arg_array = event.content.split()
  event.respond($roles) if arg_array.length == 1

  arg_array.each do |arg|
    event.server.roles.each do |role|
      if arg.downcase == role.name.downcase
        case arg_array[1]
          when "add"
            event.user.add_role(role.id)
            event.respond("gave you #{role.name}!")
          when "remove"
            event.user.remove_role(role.id)
            event.respond("took away #{role.name}!")
        end
      end
    end
  end
  nil
end

command_handler.command(:poll) do |event|
  arg_array = event.content.split()
  if arg_array.length <3 # uwu
    event.respond("you must supply at least 2 options")
    break
  end

  load('../aux/integer_overload.rb')
  event.message.delete()
  dnbot_message = event.respond(event.content[5..-1])
  (arg_array.length - 1).times do |n|
    dnbot_message.react(n.to_reaction_monkey_edition)
  end
end

command_handler.command(:vote) do |event|
  event.message.delete()
  dnbot_message = event.respond(event.content[5..-1])
  dnbot_message.react(":upvote:623516945978884097")
  dnbot_message.react(":downvote:623515777185742858")
end

command_handler.command(:kick) do |event|
  event.channel.start_typing()
  if event.author.highest_role.name =~ /(wheel|root)/
    event.message.mentions.each do |user|
      event.server.kick(user)
    end
    event.respond("kicked")
  else
    event.respond("only root can do that")
  end
end

command_handler.command(:ban) do |event|
  event.channel.start_typing()
  if event.author.highest_role.name =~ /(wheel|root)/
    event.message.mentions.each do |user|
      event.server.ban(user)
      event.respond("#{user.name} was banned")
    end
  else
    event.respond("only root can do that")
  end
  nil
end

=begin
not working for some reason
command_handler.command(:unban) do |event|
  event.channel.start_typing()
  if event.author.highest_role.name =~ /(wheel|root)/
    event.message.mentions.each do |user|
      event.server.unban(user)
    end
    event.respond("unbanned!")
  else
    event.respond("only root can do that..")
  end
end
=end

command_handler.command(:mute) do |event|
  if event.author.highest_role.name =~ /(wheel|root)/
    event.message.mentions.each do |user|
      user.on(event.server)&.add_role(546364599432249345)
    end
    event.respond("muted")
  else
    event.respond("only root can do that")
  end
end

command_handler.command(:unmute) do |event|
  if event.author.highest_role.name =~ /(wheel|root)/
    event.message.mentions.each do |user|
      user.on(event.server)&.remove_role(546364599432249345)
    end
    event.respond("unmuted")
  else
    event.respond("only root can do that")
  end
end

command_handler.command(:kill) do |event|
  if event.author.highest_role.name =~ /(wheel|root)/
    event.respond("goodbye")
    exit 1
  else
    event.respond("only root can do that")
  end
end

command_handler.member_join do |event|
  dnbot
    .channel(555197515209768971)
    .send(
      "#{event.user.mention}" +
      "Welcome to /dev/null - you are member \##{
        event.server.member_count -
        event.server.members.select(&:bot_account?).length
      }\n" + 
      "send `;roles` in #{dnbot.channel(555197515209768971).mention} to see roles\n" +
      "send `;help` to get help"
    )
end

command_handler.run()
