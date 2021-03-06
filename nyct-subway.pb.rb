#!/usr/bin/env ruby
# Generated by the protocol buffer compiler. DO NOT EDIT!

require 'protocol_buffers'

begin; require 'gtfs-realtime.pb'; rescue LoadError; end

# forward declarations
class TripReplacementPeriod < ::ProtocolBuffers::Message; end
class NyctFeedHeader < ::ProtocolBuffers::Message; end
class NyctTripDescriptor < ::ProtocolBuffers::Message; end
class NyctStopTimeUpdate < ::ProtocolBuffers::Message; end

class TripReplacementPeriod < ::ProtocolBuffers::Message
  optional :string, :route_id, 1
  optional ::TransitRealtime::TimeRange, :replacement_period, 2
end

class NyctFeedHeader < ::ProtocolBuffers::Message
  required :string, :nyct_subway_version, 1
  repeated ::TripReplacementPeriod, :trip_replacement_period, 2
end

class NyctTripDescriptor < ::ProtocolBuffers::Message
  # forward declarations

  # enums
  module Direction
    include ::ProtocolBuffers::Enum
    NORTH = 1
    EAST = 2
    SOUTH = 3
    WEST = 4
  end

  optional :string, :train_id, 1
  optional :bool, :is_assigned, 2
  optional ::NyctTripDescriptor::Direction, :direction, 3
end

class NyctStopTimeUpdate < ::ProtocolBuffers::Message
  optional :string, :scheduled_track, 1
  optional :string, :actual_track, 2
end

