## Rails API 1/31/24 Indica

## Vocabulary
- API: Application Programming Interface
    - allows applications to communicate with each other
    - transmits data in the form of JavaScript Object Notation(JSON)
    - receives a request from a different application and the API endpoint will respond back with the appropriate data

- JSON: JavaScript Object Notation, format that the data is sent in

- endpoint: method inside the applicable controller that will send the specified data as response 

- Postman: data visualization tool

- resource: command that will generate a controller, method, view, and routes
    `$ rails g resource ChickenCoop name:string variant:string origin:string`

1. Create empty repo
2. Create a local app
3. Connect the repo and app with the git remote add command
4. Initial commit
5. Initial configuration
    a) Install the rspec gem
    b) Generate resource
    c) Save changes to db schema
    d) Scaffold entries
    e) Disable the authenticity token
