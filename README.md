# frontend-challenge-mock-server

You can acess a live version at: https://desolate-temple-06848.herokuapp.com/

## Endpoints

- GET `/payment/:id`
- GET `/payment/:id/notifications`
- POST `/payment/:id/notifications`

## Payload
### GET `/payment/:id`

#### Response

```json
{
  "id": "fc66ca9d-ea9e-4799-9814-2660d725b30c",
  "status": "deposited",
  "external_identifier": "84AVR7365001",
  "paid_amount_in_cents": 50000,
  "total_amount_in_cents": 50000,
  "effective_at": "Sun, 01 Sep 2019",
  "due_at": "Thu, 28 Nov 2019",
  "contract_id": ,
  "paid_at": "Tue, 01 Oct 2019 00:00:00 UTC +00:00",
  "barcode_number": "12345",
}
```

### GET `/payment/:id/notifications`
 
#### Response body

```json
{ 
  "notifications": [
    { 
      "id": "26f5a11-f519-4ed4-b0df-4ecb57a1433e",
      "kind": "email_notification",
      "created_at": "2020-06-09T18:52:34-03:00",
      "opened_at": "2020-06-10T18:52:34-03:00",
      "body": "Email de notificação",
      "payment_id": "1f18f936-81a7-4066-8f26-bef42cd9b147"
    },
    { 
      "id": "2e4ff111-04cc-4c5d-b196-6b25140ddf73",
      "kind": "sms_notification",
      "created_at": "2020-06-10T18:52:34-03:00",
      "opened_at": null,
      "body": "SMS de notificação",
      "payment_id": "1f18f936-81a7-4066-8f26-bef42cd9b147"
    },
    {
      "id": "19e2cd42-0547-4205-a4fc-46764500769a",
      "kind": "inbound_message",
      "created_at": "2020-06-12T13:52:00-03:00",
      "opened_at": null,
      "body": "Não recebi o email com o boleto",
      "payment_id": "1f18f936-81a7-4066-8f26-bef42cd9b147"
    },
    {
      "id": "59ee475f-6693-429b-bacf-15881da652e4",
      "kind": "outbound_message",
      "created_at":  "2020-06-12T15:40:34-03:00":,
      "opened_at": "2020-06-12T18:52:34-03:00":,
      "body": "Você pode verificar se o email chegou",
      "payment_id": "1f18f936-81a7-4066-8f26-bef42cd9b147"
    },
  ]
}
```

## POST `/payment/:id/message`

### Request body

```json
{
  "notification": { "body": "bla bla bla" }
}
```

### Response Body

```json
{
  "id": 39034903904909,
  "kind": "outbound_message",
  "created_at": "2020-06-12T18:52:34-03:00",
  "opened_at": null,
  "body": "bla bla bla",
  "payment_id": "1f18f936-81a7-4066-8f26-bef42cd9b147"
}
```
