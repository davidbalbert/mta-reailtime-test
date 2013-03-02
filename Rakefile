task :default => :generate_protobufs

desc "Generate ruby files from GTFS protobuf files"
task :generate_protobufs => ["nyct-subway.pb.rb", "gtfs-realtime.pb.rb"]

file "nyct-subway.pb.rb" => ["nyct-subway.proto"] do
  system "ruby-protoc nyct-subway.proto"
end

file "gtfs-realtime.pb.rb" => ["gtfs-realtime.proto"] do
  system "ruby-protoc gtfs-realtime.proto"
end
