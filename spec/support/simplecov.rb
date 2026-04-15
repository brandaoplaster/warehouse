require "simplecov"

SimpleCov.start do
  add_group "Controllers", "app/controllers"
  add_group "Models", "app/models"
  add_group "Services", "app/services"

  add_filter "/spec/"
  add_filter "/config/"

  minimum_coverage 80
end
