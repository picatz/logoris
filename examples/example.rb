# Path setting slight of hand you can ignore if not running it for debugging, basically
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# requre the gem
require 'logoris'

# New Logoris instance.
logger = Logoris.new

# Use STDOUT, per usual.
logger.out "Normal stuff."

# Use STDERR, usually for, like, diagnostics for errors
# and stuff like that.
logger.error "Error stuff."


# If you were to run this example, you could check the streams
# are beining handled properly by redirecting the output yourself!
#
# ```shell
# ruby example.rb 2> error.txt
# ```
#
# ```shell
# ruby example.rb > out.txt
# ```
#
# Redirect both to a file? Easy!
# ```shell
# ruby example.rb &> log_em_both.txt
# ```
#
# Do whatever you need to do fam'.
