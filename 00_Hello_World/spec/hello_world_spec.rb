require_relative "../lib/hello_world.rb"
describe 'printing name' do
  it 'should print out name' do
    expect { hello_world }.to output("Hello World").to_stdout
  end
end
