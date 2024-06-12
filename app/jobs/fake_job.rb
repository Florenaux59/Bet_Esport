class FakeJob < ApplicationJob
  queue_as :default

  def perform
    Rails.application.load_tasks
    Rake::Task['db:seed'].invoke
  end
end
