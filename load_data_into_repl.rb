#!/usr/bin/env ruby

module Enumerable
  def to_h
    Hash[self]
  end
end

$LOAD_PATH.unshift(".")

require 'nyct-subway.pb'

data = TransitRealtime::FeedMessage.parse(File.read("mtafeed"))

groups = data.entity.group_by do |e|
  if e.has_trip_update?
    :trip_update
  elsif e.has_vehicle?
    :vehicle
  elsif e.has_alert?
    :alert
  else
    :else
  end
end.map do |type, entities|
  [type, entities.map { |e| e.send(type) }]
end.to_h

require 'pry'

# Available local variables are `groups` and `data`
binding.pry
