json.report do
  json.record_id @report.record_id
  json.is_complete @report.is_complete
  json.user do
    json.id @report.user.id
    json.fullname @report.user.fullname
  end
end
