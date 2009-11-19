
use Rack::Static, :urls => ['/']
run lambda{ |dummy_never_called| }
