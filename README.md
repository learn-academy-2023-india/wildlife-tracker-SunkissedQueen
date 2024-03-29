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

## Work flow
- create branch for each API endpoint (index, create, show, update, destroy)
- create a controller method for that endpoint
- To see available routes: $ rails routes -E
- Postman instructions:
    - http verb -> url 
    - Click the send button
    - Body -> Pretty -> JSON
- Status codes
    - 200 OK means a successful response
    - 404 Not found means the route does not exist
    - To see the error: Body -> Preview

## index
send all the instances
### controller
```rb
class ChickenCoopsController < ApplicationController
  # index API endpoint
  def index
    # active record query for all the instances
    chickens = ChickenCoop.all
    # no views, render the json
    render json: chickens
  end
end
```
### Postman
    - GET ->  localhost:3000/chicken_coops
    - Click the send button
    - Body -> Pretty -> JSON

## show
returns one instance 
## controller
```rb
def show
  chicken = ChickenCoop.find(params[:id])
  render json: chicken
end
```
## Postman
    - GET ->  localhost:3000/chicken_coops/3
    - Click the send button
    - Body -> Pretty -> JSON

## create
return the new instance that was saved to the database
## controller
```rb
  def create
    chicken = ChickenCoop.create(chicken_params)
    # if saved,response with the new chicken as json
    if chicken.valid?
      render json: chicken
    # if not, response with errors
    else
      render json: chicken.errors
    end
  end

  private
  def chicken_params
    params.require(:chicken_coop).permit(:name, :variant, :origin)
  end
```
## Postman
    - POST ->  localhost:3000/chicken_coops
    - Body -> raw -> JSON
```bash
    # keys are strings for the JSON data
    {
        "name": "Chanticleer",
        "variant": "Chicken",
        "origin": "Independent Studio"
    }
```
    - Click the send button
    - Body -> Pretty -> JSON

## update
return the saved modifications to the database
### controller
```rb
  def update
    chicken = ChickenCoop.find(params[:id])
    chicken.update(chicken_params)
    if chicken.valid?
      render json: chicken
    else
      render json: chicken.errors
    end
  end
```
### Postman
    - PATCH ->  localhost:3000/chicken_coops/5
    - Body -> raw -> JSON
```bash
    # keys are strings for the JSON data
    # only provide the key:value pairs that will be modified
    {
        "name": "Chance",
        "variant": "Rooster"
    }
```
    - Click the send button
    - Body -> Pretty -> JSON