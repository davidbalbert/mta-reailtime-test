require 'open-uri'

desc "Create foreman .env file"
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
task :update_data do
  open("http://datamine.mta.info/mta_esi.php?key=#{ENV["MTA_API_KEY"]}") do |feed|
    File.open("mtafeed", "w") do |f|
      f.write(feed.read)
    end
  end
end

desc "Generate ruby files from GTFS protobuf files"
task :generate_protobufs => ["nyct-subway.pb.rb", "gtfs-realtime.pb.rb"]

file "nyct-subway.pb.rb" => ["nyct-subway.proto"] do
  system "ruby-protoc nyct-subway.proto"
end

file "gtfs-realtime.pb.rb" => ["gtfs-realtime.proto"] do
  system "ruby-protoc gtfs-realtime.proto"
end