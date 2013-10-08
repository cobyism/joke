# Gemspec/Rakefile from https://github.com/mojombo/rakegem

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "joke/app"

Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'joke'
  s.version           = '0.0.1'
  s.date              = '2013-10-08'
  s.rubyforge_project = 'joke'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary     = "A local CMS for Jekyll sites."
  s.description = "Joke lets you manage Jekyll sites locally like a CMS."

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors  = ["Coby Chapple"]
  s.email    = 'coby@github.com'
  s.homepage = 'https://github.com/cobyism/joke'
  s.license  = 'MIT'

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  ## This sections is only necessary if you have C extensions.
  # s.require_paths << 'ext'
  # s.extensions = %w[ext/extconf.rb]

  ## If your gem includes any executables, list them here.
  s.executables = ["joke"]

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.
  s.add_dependency('sinatra')
  s.add_dependency('jekyll')

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  s.add_development_dependency('rack-test')

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = %w[
    LICENSE
    README.md
    Rakefile
    _config.yml
    bin/joke
    joke.gemspec
    lib/joke.rb
    lib/joke/app.rb
    lib/joke/helpers.rb
    lib/joke/public/stylesheets/main.css
    lib/joke/views/config.erb
    lib/joke/views/index.erb
    lib/joke/views/layout.erb
    lib/joke/views/pages.erb
    lib/joke/views/posts.erb
    test/source/index.html
    test/test_joke.rb
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
