class PublishReportJob < ApplicationJob
  queue_as :default
  def perform(report_id)
    report = Report.find_by(id: report_id)
    return unless report && report.published?
    Rails.logger.info "[NOTIFY] '#{report.title}' published by #{report.user.email} at #{Time.current}"
  end
end
