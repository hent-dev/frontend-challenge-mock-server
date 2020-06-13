# frontend-challenge-mock-server

You can acess a live version at: https://desolate-temple-06848.herokuapp.com/

## Endpoints

- GET `/payments/:id`
- GET `/payments/:id/notifications`
- POST `/payments/:id/notifications`

## Payload
### GET `/payments/:id`

#### Response

```json
{
  "id": "22345544-343455-332244",
  "status": "overdue",
  "total_amount_in_cents": 102617,
  "effective_at": "2020-05-26",
  "due_at": "2020-06-12",
  "barcode_number": "30905047827545423862193743386110806080808159",
  "paid_amount_in_cents": null,
  "contract": {
    "id": "3344c914-ab74-48d8-84c7-9a01db631816",
    "place": "Apt. 122 4225 Bernard Shores, West Newton, ME 62891-1044"
  },
  "payer": {
    "name": "Angela Kling",
    "email": "chuck@marvin.info",
    "phone_number": "834-907-1047"
  }
}
```

### GET `/payments/:id/notifications`
 
#### Response body

```json
{ 
  "notifications": [
    {
      "id": "b178cd64-2977-40d3-b8c7-047ac975b4dd",
      "kind": "email_notification",
      "body": "Primeiro email com cobrança enviado",
      "created_at": "2020-06-13T19:53:10-03:00",
      "opened_at": null,
      "payment_id": "22345544-343455-332244"
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
    }
  ]
}
```

## POST `/payments/:id/message`

This endpoint accepts form-encoded request bodies, returns JSON-encoded responses.

### Request body

```
notification[body]= "bla bla bla"
```

### Response Body

```json
{
    "id": "a1b8fb2f-784c-461f-b2ad-520e2d0316f5",
    "kind": "outbound_message",
    "body": "testando",
    "created_at": "2020-06-13T20:18:28-03:00",
    "opened_at": null,
    "payment_id": "22345544-343455-332244"
}
```
