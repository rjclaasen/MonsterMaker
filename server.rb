# Mostly copied from https://practicingruby.com/articles/implementing-an-http-file-server

require "socket"
require "uri"

WEB_ROOT = "./public"

CONTENT_TYPE_MAPPING = {
  "html" => "text/html",
  "css" => "text/css",
  "js" => "text/javascript",
  "txt" => "text/plain",
  "png" => "image/png",
  "jpg" => "image/jpeg",
  "json" => "application/json"
}

DEFAULT_CONTENT_TYPE = "application/octet-stream"

def content_type(path)
  ext = File.extname(path).split(".").last
  CONTENT_TYPE_MAPPING.fetch(ext, DEFAULT_CONTENT_TYPE)
end


# Something about security issues that causes this to be complicated. See the source of this code (see top) for answers (maybe).
def requested_file(request_line)
  request_uri = request_line.split(" ")[1]
  path = URI.unescape(URI(request_uri).path)

  clean = []

  parts = path.split("/")

  parts.each do |part|
    next if part.empty? || part == "."
    part == ".." ? clean.pop : clean << part
  end

  File.join(WEB_ROOT, *clean)
end

server = TCPServer.new('localhost', 8000)

loop do
  socket = server.accept
  request_line = socket.gets

  STDERR.puts request_line

  path = requested_file(request_line)

  + path = File.join(path, "index.html") if File.directory?(path)

  if File.exist?(path) && !File.directory?(path)
    File.open(path, "rb") do |file|
      socket.print "HTTP/1.1 200 OK\r\n" +
                   "Content-Type: #{content_type(file)}\r\n" +
                   "Content-Length: #{file.size}\r\n" +
                   "Connection: close\r\n"

      socket.print "\r\n"

      IO.copy_stream(file, socket)
    end
  else
    message = "File not found\n"

    socket.print "HTTP/1.1 404 Not Found\r\n" +
                 "Content-Type: text/plain\r\n" +
                 "Content-Length: #{message.size}\r\n" +
                 "Connection: close\r\n"

    socket.print "\r\n"

    socket.print message
  end

  socket.close
end
