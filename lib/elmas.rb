require "elmas/version"
require "elmas/api"
require "elmas/config"
require "elmas/response"
require "elmas/client"
require "oauth2"

module Elmas
  extend Config

  def self.client(options={})
    Elmas::Client.new(options)
  end

  # Delegate to Elmas::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Elmas::Client
  def self.respond_to?(method, include_all=false)
    return client.respond_to?(method, include_all) || super
  end
end