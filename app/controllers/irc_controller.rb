class IrcController < ApplicationController

# this is very simple, just some views with embedded iframes.
#
# /irc is matched to the index method in routes.rb
# you can also try /irc/alt for the freenode webchat widget 
# (there's a flash client at /irc/alt2 but I think it's busted w/ freenode)
#
# it looks possible to build the kiwiIRC client, embed as an asset, and customize.
# possibly we could set an upfrontwichita cookie to remember/autopopulate the user's nick.
# i've got to run for now, though.

  def index
  end

  def alt
  end

  def alt2
  end
end
