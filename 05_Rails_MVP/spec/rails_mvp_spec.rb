require_relative 'spec_helper.rb'
require_relative 'rails_helper.rb'

# ADD TO README LATER:
# For this challenge, you will use all the knowledge you've learned
# in the past few challenges. You will create two models: projects and companies.
# For each of these models, you will also create associated controllers which 
# will implement all the basic CRUD actions. Finally, you will create views 
# for some of the actions.

# To start, projects should have 
#
#
#
#
#
#

describe "Project Model" do
  it 'should be a created Model' do
    expect(Project).to be_a_kind_of(Class)
  end
  it 'should have name, age, email' do
    expect(Project.attribute_names).to include("name", "location", "expected_revenue")
  end

  it 'should be invalid without a name and email' do
    project = Project.new(name: nil, location:nil, expected_revenue:nil)
    expect(project).to_not be_valid
  end
  it 'is valid with valid attributes' do
    project = Project.new(name: "Placeholder", location: "Placeholder", expected_revenue: 0)
    expect(project).to be_valid
  end
end

describe "Company Model" do
   it 'should be a created Model' do
    expect(Company).to be_a_kind_of(Class)
  end
  it 'should have name, age, email' do
    expect(Company.attributes).to include("name", "number_of_employees")
  end

  it 'should be invalid without a title and description' do
    company = Company.new(name: nil, number_of_employees: nil)
    expect(project).to_not be_valid
  end
  it 'is valid with valid attributes' do
    company = Company.new(name: "Example Company", number_of_employees:0)
    expect(company).to be_valid
  end
end
describe 'Project Association' do
  it 'has_many companies' do
    assc = Project.reflect_on_association(:companies)
    expect(assc.macro).to eq(:has_many)
  end
end
describe 'Company Association' do
  it 'belongs_to Project' do
    t = Company.reflect_on_association(:project)
    expect(t.macro).to eq(:belongs_to)
  end
end


RSpec.describe ProjectsController do
  item_history = Project.new(name:nil, location:nil, expected_revenue:nil)

  describe ProjectsController, type: :controller do
    it 'should be created and have a route to index' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'should have an index action in the controller' do
      expect(controller.index) 
    end
    it 'should correctly set instance variable in index action' do
      Project.create(name:"First", location:"First, USA", expected_revenue:1)
      Project.create(name:"Second", location:"Second, USA", expected_revenue:2)
      Project.create(name:"Third", location:"Third, USA", expected_revenue:3)
      get :index
      expect(assigns(:projects).size).to eq(3)
    end
  end

  describe "Project View", type: :view  do
    it 'should have an index view' do
      expect(Dir["#{Rails.root}/app/views/projects/index.html.erb"]).not_to be_empty
    end
    it 'should display item history names' do
      Project.create(name:"First", location:"First, USA", expected_revenue:1)
      Project.create(name:"Second", location:"Second, USA", expected_revenue:2)
      Project.create(name:"Third", location:"Third, USA", expected_revenue:3)

      @projects = Project.all
      
      render :file => 'projects/index.html.erb'
      expect(rendered).to match /First/
      expect(rendered).to match /Second/
      expect(rendered).to match /Third/
    end
  end
end
