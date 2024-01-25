class ProcessCsvFileJob
  include Sidekiq::Job

  def perform(s)
    s.times do
      puts s * 5
    end
  end
end
