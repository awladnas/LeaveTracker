json.array!(@leaves) do |leafe|
  json.extract! leafe, :id, :user_id, :leave_type, :leave_status, :leave_date
  json.url leafe_url(leafe, format: :json)
end
