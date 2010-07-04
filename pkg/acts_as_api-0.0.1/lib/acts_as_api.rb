require "rubygems"

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "acts_as_api/base"
require "acts_as_api/rendering"
require "acts_as_api/array"

# acts_as_api is a gem that aims to make the construction of JSON and XML
# responses in rails 3 easy and fun.
#
# Therefore it attaches a couple of helper methods to active record and
# the action controller base classes.
#
# acts_as_api uses the default serializers of your rails app and doesn't
# force you into more dependencies.
module ActsAsApi
  VERSION = '0.0.3'

  # The accepted response formats
  # Default is +[:xml, :json]+
  ACCEPTED_API_FORMATS = [:xml, :json]

  # Holds references to formats that need
  # to get added an additional root node
  # with the name of the model.
  ADD_ROOT_NODE_FOR = [:json]

end

# Attach ourselves to active record
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsApi::Base
end

# Attach ourselves to the abstract controller of rails
if defined?(AbstractController::Rendering)
  AbstractController::Rendering.send :include, ActsAsApi::Rendering
end