require 'sinatra'
require './lib/mock_payment'
require "sinatra/reloader" if development?
require 'json'

get '/' do
  respond_with :index, :name => 'example' do |f|
    f.txt { 'just an example' }
    end
end

get '/payments/:id' do
  "Hello world! #{params[:id]}"
end

get '/payments/:id/notifications' do
  basic_notifications = [
    MockPayment.new(body: 'Primeiro email com cobrança enviado',
                    payment_id: params[:id], 
                    kind:'email_notification'),
    MockPayment.new(body: 'Segundo email com cobrança enviado',
                    payment_id: params[:id], 
                    kind:'email_notification'),
    MockPayment.new(body: 'SMS no vencimento enviado ',
                    payment_id: params[:id], 
                    kind:'sms_notification'),
  ]
  
#  basic_notifications.pust
  %i[email_notification sms_send]
  payment = MockPayment.new(body: 'bla bla', payment_id: params[:id], kind: 'inbound_message')
  payment.to_json
end

post '/payments/:id/notifications' do
  payment = MockPayment.new(body: params[:notification][:body], payment_id: params[:id])
  payment
end

