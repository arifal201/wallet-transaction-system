# API DOC

## Users API

### Login 

* Endpoint : POST localhost:3000/login
* Request body json : 
```json
{
  "user" : {
    "email" : "example@example.com",
    "password" : "examplePassword"
  }
}
```
* Response json : 
```json
{
  "data" : {
    "username" : "example username",
    "email" : "example@example.com",
    "token" : "generate new token"
  },
  "message" : "login success"
}
```
### Register 

* Endpoint : POST localhost:3000/users
* Request body json : 
```json
{
  "user" :{
    "username" : "example",
    "email" : "example@example.com",
    "password" : "examplePassword"
  }
}
```
* Response json : 
```json
{
  "data" : {
    "username" : "example username",
    "email" : "example@example.com"
  },
  "message" : "create success"
}
```

## Price API

* Endpoint : GET localhost:3000/price
* Headers : Bearer Token 
* Response body json : 
```json
{
  "data" : [
    {
      "symbol": "NIFTY 50",
      "identifier": "NIFTY 50",
      "open": 19246.5,
      "dayHigh": 19345.1,
      "dayLow": 19234.4,
      "lastPrice": 19322.55,
      "previousClose": 19189.05,
      "change": 133.5,
      "pChange": 0.7,
      "yearHigh": 19345.1,
      "yearLow": 15858.2,
      "totalTradedVolume": 226050219,
      "totalTradedValue": 226814200944.72,
      "lastUpdateTime": "03-Jul-2023 16:00:00",
      "perChange365d": 21.82,
      "perChange30d": 3.53
    }
  ],
  "total_data": 51,
  "total_page": 6,
  "current_page": 1,
  "prev_page": null,
  "next_page": 2,
  "message": "success get price"
}
```

## Prices API
* Endpoint : GET localhost:3000/prices
* Headers : Bearer Token
* Response json : 
```json
{
  "data" : [
    {
      "symbol": "NIFTY 50",
      "identifier": "NIFTY 50",
      "open": 19246.5,
      "dayHigh": 19345.1,
      "dayLow": 19234.4,
      "lastPrice": 19322.55,
      "previousClose": 19189.05,
      "change": 133.5,
      "pChange": 0.7,
      "yearHigh": 19345.1,
      "yearLow": 15858.2,
      "totalTradedVolume": 226050219,
      "totalTradedValue": 226814200944.72,
      "lastUpdateTime": "03-Jul-2023 16:00:00",
      "perChange365d": 21.82,
      "perChange30d": 3.53
    }
  ],
  "total_data": 51,
  "total_page": 6,
  "current_page": 1,
  "prev_page": null,
  "next_page": 2,
  "message": "success get prices"
}
```

## Price All API
* Endpoint : GET localhost:3000/price_all
* Headers : Bearer Token
* Response json : 
```json
{
  "data" : [
    {
      "symbol": "NIFTY 50",
      "identifier": "NIFTY 50",
      "open": 19246.5,
      "dayHigh": 19345.1,
      "dayLow": 19234.4,
      "lastPrice": 19322.55,
      "previousClose": 19189.05,
      "change": 133.5,
      "pChange": 0.7,
      "yearHigh": 19345.1,
      "yearLow": 15858.2,
      "totalTradedVolume": 226050219,
      "totalTradedValue": 226814200944.72,
      "lastUpdateTime": "03-Jul-2023 16:00:00",
      "perChange365d": 21.82,
      "perChange30d": 3.53
    }
  ],
  "total_data": 809,
  "total_page": 81,
  "current_page": 1,
  "prev_page": null,
  "next_page": 2,
  "message": "success get price all"
}
```

## AutoComplete API
* Endpoint : GET localhost:3000/autocomplete/price
* Headers : Bearer Token
* Response body json : 
```json
{
  "data" : [
    {
    "symbol": "NIFTY 50",
    "identifier": "NIFTY 50",
    "open": 19246.5,
    "dayHigh": 19345.1,
    "dayLow": 19234.4,
    "lastPrice": 19322.55,
    "previousClose": 19189.05,
    "change": 133.5,
    "pChange": 0.7,
    "yearHigh": 19345.1,
    "yearLow": 15858.2,
    "totalTradedVolume": 226050219,
    "totalTradedValue": 226814200944.72,
    "lastUpdateTime": "03-Jul-2023 16:00:00",
    "perChange365d": 21.82,
    "perChange30d": 3.53
    }
  ],
  "message" : "success autocomplete"
}
```
## Create Transaction API
* Endpoint : POST localhost:3000/transactions/create
* Headers : Bearer Token
* Request body json : 
```json
{
  "transactions" : {
    "amount" : 10000,
    "transaction_type" : "credit", // credit or debit
    "symbol": "NIFTY 50",
    "identifier": "NIFTY 50",
    "open": 19246.5,
    "day_high": 19345.1,
    "day_low": 19234.4,
    "last_price": 19322.55,
    "previous_close": 19189.05,
    "change": 133.5,
    "p_change": 0.7,
    "year_high": 19345.1,
    "year_low": 15858.2,
    "total_traded_volume": 226050219,
    "total_traded_value": 226814200944.72,
    "last_update_time": "03-Jul-2023 16:00:00",
    "per_change_365d": 21.82,
    "per_change_30d": 3.53
  }
}
```
* Response body json : 
```json
{
  "data": {
      "id": 8,
      "user_id": 16,
      "transaction_type": "credit",
      "amount": "80000.0",
      "symbol": "NIFTY 50",
      "identifier": "NIFTY 50",
      "open": "19246.5",
      "day_high": "19345.1",
      "day_low": "19234.4",
      "last_price": "19322.55",
      "previous_close": "19189.05",
      "change": "133.5",
      "p_change": "0.7",
      "year_high": "19345.1",
      "year_low": "15858.2",
      "total_traded_volume": "226050219.0",
      "total_traded_value": "226814200944.72",
      "last_update_time": "03-Jul-2023 16:00:00",
      "per_change_365d": "21.82",
      "per_change_30d": "3.53",
      "created_at": "2023-07-03T19:22:28.890Z",
      "updated_at": "2023-07-03T19:22:28.890Z"
  },
  "message": "success create transaction"
}
```
## Wallet API
### Topup Wallet API
* Endpoint : PATCH localhost:3000/topup
* Headers : Bearer Token
* Request Body json : 
```json
{
  "wallet" : {
    "amount" : 100000
  }
}
```
* Response body json : 
```json
{
  "data": {
    "balance": "800000.0",
    "id": 2,
    "user_id": 16,
    "created_at": "2023-07-03T09:15:20.219Z",
    "updated_at": "2023-07-03T17:46:20.187Z"
  },
  "message": "success top up 100000"
}
```
### Show Wallet API 
* Endpoint : GET localhost:3000/wallet/:id
* Headers : Bearer Token
* Response Body json :
```json
{
  "data": {
    "id": 2,
    "balance": "370000.0",
    "user_id": 16,
    "created_at": "2023-07-03T09:15:20.219Z",
    "updated_at": "2023-07-03T19:22:28.896Z"
  },
  "message": "success get wallet"
}
```