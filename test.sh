#/bin/sh
set PATH=%Path%;C:/Ruby30-x64/bin
cd parser_task
gem install bundler
bundle install
cd tasks
bundle exec ruby parser.rb