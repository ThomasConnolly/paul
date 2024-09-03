# lib/tasks/test_webhook_job.rake
namespace :test do
  desc 'Test WebhookJob with a sample payment_intent.succeeded event'
  task webhook_job: :environment do
    sample_event = {
      id: 'evt_test',
      type: 'payment_intent.succeeded',
      data: {
        object: {
          id: 'pi_test',
          amount: 2000,
          currency: 'usd',
          payment_method: 'pm_1PuuOZ2eZvKYlo2CXb72c5fh'
        }
      }
    }.to_json

    WebhookJob.perform_now(sample_event)
  end
end
