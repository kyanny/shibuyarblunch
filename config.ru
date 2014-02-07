use Rack::ETag
use Rack::Static, {
  urls: ["/"],
  root: ["docroot"],
  index: "index.html",
  header_rules: [
    [:all,    { "Content-Type" => "text/html" }],
    [["css"], { "Content-Type" => "text/css" }],
    [["js"],  { "Content-Type" => "text/javascript" }]
  ]
}
run Rack::File.new("docroot/index.html")
