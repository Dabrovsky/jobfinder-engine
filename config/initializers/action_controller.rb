Rails.application.configure do
  config.action_controller.always_permitted_parameters = %w(controller action format)
end
