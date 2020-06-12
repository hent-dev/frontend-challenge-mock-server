require 'time'
require 'securerandom'
require 'json'

# kind: inbound_message, outbound_message, sms_notification, email_notification
MockPayment = Struct.new(:id, :kind, :body,:created_at,:opened_at, :payment_id) do
  def initialize(
    id: SecureRandom.uuid,
    kind:,
    body:,
    created_at: Time.now.iso8601,
    opened_at: [nil, (Time.now+60).iso8601].sample,
    payment_id: nil)
    super(id, kind, body, created_at, opened_at, payment_id)
    puts self
  end
  
  def to_json
    self.to_h.to_json
  end
end

