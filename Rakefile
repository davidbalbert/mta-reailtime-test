require 'open-uri'

desc "Create .env file with MTA API key"
task :setup => [:drop_env, ".env"]

task :drop_env do
  File.unlink(".env") if File.exists?(".env")
end

file ".env" do
  print "MTA API key: "
  key = $stdin.gets.chomp

  File.open(".env", "w") do |f|
    f.puts("MTA_API_KEY=#{key}")
  end
end

desc "Download latest real-time schedule information"
task :update => ".env" do
  api_key = ENV["MTA_API_KEY"]

  if !api_key && File.exists?(".env")
    api_key = File.readlines(".env").grep(/^MTA_API_KEY=/).first.split("=")[1]
  end

  open("http://datamine.mta.info/mta_esi.php?key=#{api_key}") do |feed|
    File.open("mtafeed", "w") do |f|
      f.write(feed.read)
    end
  end
end

desc "Generate ruby files from GTFS protobuf files"
task :generate => [:require_protoc, "nyct-subway.pb.rb", "gtfs-realtime.pb.rb"]

task :require_protoc do
  unless system "which protoc >/dev/null"
    $stderr.puts "Error: You need protoc - the protoc buffer compiler"
    $stderr.puts "You can install it by running `brew install protobuf`"
    exit 1
  end
end

file "nyct-subway.pb.rb" => ["nyct-subway.proto"] do
  system "ruby-protoc nyct-subway.proto"
end

file "gtfs-realtime.pb.rb" => ["gtfs-realtime.proto"] do
  system "ruby-protoc gtfs-realtime.proto"
end
