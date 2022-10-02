class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # To include that summary method in the JSON response, we can do so using the methods
    render json: cheeses, only: [:created_at, :updated_at], methods: [:summary]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])

    if cheese

    # producing only id, name, price, and is_best_seller for each cheese
    render json: cheese, except: [:created_at, :updated_at]
     else 
      render json: {error: 'cheese not found'}, status: :not_found

    end
  end

end

# NB Both the only and except options are available to us thanks to the .as_json
