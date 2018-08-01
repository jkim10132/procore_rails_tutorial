require 'spec_helper'
require 'rails_helper'

# ADD TO README LATER:
# For this challenge you must create the Rails controller for
# the ItemHistory model. Use 'rails g controller' to create 
# a controller called item_histories_controller with just an index action.
# In this index action, properly assign an instance variable to all existing
# ItemHistory objects in the database.
# 
# Create a .html.erb file for index 
# (ignore this if you created them already with the rails g controller method).
# In index.html.erb, have the page display all existing ItemHistory names.
# ** Make sure that there is an existing route for your index action! Use the "resources" 
# keyword for this. **

RSpec.describe ItemHistoriesController do
  item_history = ItemHistory.new(name:nil, times_modified:nil)

  describe ItemHistoriesController, type: :controller do
    it 'should be created and have a route to index' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'should have an index action in the controller' do
      expect(controller.index) 
    end
    it 'should correctly set instance variable in index action' do
      ItemHistory.create(name:"First", times_modified:1)
      ItemHistory.create(name:"Second", times_modified:2)
      ItemHistory.create(name:"Third", times_modified:3)
      get :index
      expect(assigns(:item_histories).size).to eq(3)
    end
  end

  describe "ItemHistory View", type: :view  do
    it 'should have an index view' do
      expect(Dir["#{Rails.root}/app/views/item_histories/index.html.erb"]).not_to be_empty
    end
    it 'should display item history names' do
      ItemHistory.create(name:"First", times_modified:1)
      ItemHistory.create(name:"Second", times_modified:2)
      ItemHistory.create(name:"Third", times_modified:3)

      @item_histories = ItemHistory.all
      
      render :file => 'item_histories/index.html.erb'
      expect(rendered).to match /First/
      expect(rendered).to match /Second/
      expect(rendered).to match /Third/
    end
  end
end
