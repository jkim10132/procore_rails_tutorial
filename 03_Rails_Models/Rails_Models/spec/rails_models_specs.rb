require_relative 'spec_helper'

describe "ProcoreUser Model" do
  it 'should be a created Model' do
    expect(ProcoreUser).to be_a_kind_of(Class)
  end
  it 'should have name, age, email' do
    expect(ProcoreUser.attribute_names).to include("name", "age", "email")
  end

  it 'should be invalid without a name and email' do
    procore_user = ProcoreUser.new(name: nil, email: nil)
    expect(procore_user).to_not be_valid
  end
  it 'is valid with valid attributes' do
    procore_user = ProcoreUser.new(name: "Placeholder", email: "placeholder@gmail.com")
    expect(procore_user).to be_valid
  end
end
describe "Contract Model" do
   it 'should be a created Model' do
    expect(Contract).to be_a_kind_of(Class)
  end
  it 'should have name, age, email' do
    expect(Contract.attributes).to include("description", "title", "status")
  end

  it 'should be invalid without a title and description' do
    procore_user = Contract.new(title: nil, description: nil)
    expect(procore_user).to_not be_valid
  end
  it 'is valid with valid attributes' do
    procore_user = Contract.new(title: "Contract", description: "Contract Description", status: false)
    expect(procore_user).to be_valid
  end
end
describe 'ProcoreUser Association' do
  it 'has_many contracts' do
    assc = ProcoreUser.reflect_on_association(:contracts)
    expect(assc.macro).to eq(:has_many)
  end
end
describe 'Contract Association' do
  it 'belongs_to ProcoreUser' do
    t = Contract.reflect_on_association(:ProcoreUser)
    epxect(t.macro).to eq(:belongs_to)
  end
end
