require 'sinatra'
require './lib/mock_notification'
require "sinatra/reloader" if development?
require 'json'
require "rdiscount"
require 'securerandom'
require 'faker'

get '/' do
  markdown File.read("README.md")
end

get '/payments/:id' do
  content_type 'application/json'
  status = %i[pending overdue paid paid paid cancelled].sample
  attributes = {
    id: params[:id],
    status: status,
    total_amount_in_cents: Faker::Number.number(digits: 6),
    effective_at: Faker::Date.backward(days: 30),
    due_at: Faker::Date.backward(days: 15),
    barcode_number: rand(('1' + ('0' * 43)).to_i..('9' * 44).to_i).to_s,
    paid_amount_in_cents: nil,
    contract: {
      id: SecureRandom.uuid,
      place: Faker::Address.full_address
    },
    payer: {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone
    }
  }
  
  if status == :paid
    attributes.merge!(paid_amount_in_cents: attributes[:total_amount_in_cents],
                      paid_at: Time.now - 86_400)
  end

  attributes.to_json
end

get '/payments/:id/notifications' do
  content_type 'application/json'

  basic_notifications = [
    MockNotification.new(body: 'Primeiro email com cobrança enviado',
                    payment_id: params[:id], 
                    kind:'email_notification'),
    MockNotification.new(body: 'Segundo email com cobrança enviado',
                    payment_id: params[:id], 
                    kind:'email_notification'),
    MockNotification.new(body: 'SMS no vencimento enviado ',
                    payment_id: params[:id], 
                    kind:'sms_notification'),
  ]
  
  if [true, true, false].sample
    emails = ['Gostaria de pedir uma redução de 10% da minha parcela', 'Gostaria de cancelar meu contrato', 'Posso pagar o mês atual atrasado sem multa?']
    payment = MockNotification.new(body: emails.sample,
                              payment_id: params[:id],
                              kind: 'inbound_message')
    basic_notifications.push(payment)
  end

  { notifications: basic_notifications }.to_json
end

post '/payments/:id/notifications' do
  content_type 'application/json'
  payment = MockNotification.new(body: params['notification']['body'],
                                 payment_id: params[:id],
                                 kind: 'outbound_message')
  payment.to_json
end

