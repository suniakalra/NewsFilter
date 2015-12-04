json.array!(@sea_reports) do |sea_report|
  json.extract! sea_report, :id
  json.url sea_report_url(sea_report, format: :json)
end
