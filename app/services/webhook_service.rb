class WebhookService
  def self.deliver(url, payload)
    response = Faraday.post(url, payload.to_json, 'Content-Type' => 'application/json')
    response.success?
  end
end