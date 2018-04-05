require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use AuthenticationController
use ExercisesController
use UsersController
use WorkoutsController
use ExerciseSetsController
run ApplicationController

