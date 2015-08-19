ROOT_PATH = File.expand_path("../")
APP_NAME = File.basename(ROOT_PATH)

$LOAD_PATH.unshift "./#{APP_NAME}"
require 'da_funk'

DaFunk::Test.configure do |t|
 t.root_path = ROOT_PATH
end

Device::Setting.logical_number = "1234"
Device::Setting.to_staging!

