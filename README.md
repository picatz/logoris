![This guy is cool.](http://i.imgur.com/0PB84Kg.png)

# Logoris

Logoris a Ruby gem that provides a simple, unified interface to manage logging for command-line applications to the appropriate standard stream.

### Why should I use this?

Do you hate having to manage your standard streams? Are your stderr events actually going to stdout, and you're like "whoa I didn't even know?" -- and you want a simple way to do this? You silly rabbit you: this is the gem for you.

#### STDOUT

Basically, when you do a `puts`, then you're going to STDOUT. This is where most of the good stuff happens.

#### STDERR

Whoa, you got some sort of gnarly error. Maybe some sort of diagnostics information that isn't really supposed to be parsed by normal input that happens for STDOUT? Well, we have STDERR for that stuff, silly.

## Installation

    $ gem install logoris

## Usage

```ruby
require 'logoris'

# create a new logoris instance, ya' know
logger = Logoris.new(log_file: "/var/log/some_application.log")

logger.error "This will go to STDERR" # for your errors
logger.out "This will go to STDOUT"   # for your normal stuff

# why not check if the log exists?
logger.log_exists?(logger.log_file)
# => true
# there's almost no reason for this method
# but, there's a method to my madness
# :)
```

Maybe you want to log your errors and regular output in their own special files?

```ruby
# assuming you've already created a new logoris instance, ya' know

# log them errors
logger.error_file = "error.log"
logger.error "This will go a to file (error.log), and to stderr"

# log them... not errors?
logger.out_file = "not_errors.log"
logger.out "This will go a to file (not_errors.log), and to stdout"

# Totes proving it works via this static example.
File.readlines(logger.error_file)
# => ["This will go a to file (error.log), and to stderr\n"]
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

