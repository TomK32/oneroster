This ruby gem is for accessing the Infinite Campus OneRoster API.

Usage:

Add to your Gemfile:

    gem 'oneroster', git: 'git@github.com/tomk32/oneroster.git'

    oneroster = Oneroster.new({'id' => 'my id', 'secret' => 'my secret'})
    puts oneroster.district

For more routes see lib/oneroster.rb

(C) 2016 Thomas R. Koll for Naiku Inc. <tomk@naiku.net>

