require 'spec_helper'
require 'rails_helper'

# ADD TO README LATER:
# For this challenge you must create the Rails controller for
# the ItemHistory model. Use 'rails g controller' to create 
# a controller called item_histories_controller with just an index action.
# 
# Create a .html.erb file for index 
# (ignore this if you created them already with the rails g controller method).
# In index, have the page display all existing ItemHistory names in the database.
# ** Make sure that there is an existing route for your index action! Use the "resources" 
# keyword for this. **

RSpec.describe ItemHistoriesController do
  item_history = ItemHistory.new(name:nil, times_modified:nil)

  describe "ItemHistory Controller", type: :controller do
    it 'should be created and have a route to index' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'should have an index action in the controller' do
      expect(controller.index) 
    end
  end

  describe "ItemHistory View", type: :view  do
    it 'should have an index view' do
      expect { get :index, :format => :html }.to_not raise_error
    end
    it 'should display all ItemHistory names' do
      render :index
    end
  end
end
