EmberCLI.configure do |c|
  c.app :frontend, path: "../frontend", exclude_ember_deps: ["jquery", "handlebars"]
  c.build_timeout = 15
end
