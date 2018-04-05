require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

environment = Sprockets::Environment.new
environment.append_path "public/css"
environment.append_path "public/javascripts"
environment.append_path "public/images"

use Rack::MethodOverride
use AuthenticationController
use ExercisesController
use UsersController
use WorkoutsController
use ExerciseSetsController
run ApplicationController