class CreatePrecalculateJob < ApplicationJob
  queue_as :default

  def perform
    CreatePrecalculate.call
  end
end
