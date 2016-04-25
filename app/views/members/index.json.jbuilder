json.array!(@members) do |member|
  json.extract! member, :id, :first_name, :last_name, :title, :organization_id, :summary, :full_text_bio, :url, :picture
  json.url member_url(member, format: :json)
end
