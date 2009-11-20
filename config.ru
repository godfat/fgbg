
require 'erb'

map '/example' do
  run lambda{ |env|
        params = Rack::Request.new(env).params
        @fg, @bg = params['fg'], params['bg']
        erb = ::File.dirname(::File.expand_path(__FILE__)) + '/fgbg.html.erb'
        [200, {'Content-Type' => 'text/html'},
          [ERB.new(::File.read(erb)).result(binding)]]
      }
end

map '/' do
  use Rack::Static, :urls => ['/']
  run lambda{ |dummy_never_called| }
end
