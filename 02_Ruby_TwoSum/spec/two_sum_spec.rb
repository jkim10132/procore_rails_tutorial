require_relative "../lib/two_sum.rb"
describe "two_sum" do
  it 'returns [nil, nil] for invalid arr' do
    expect(two_sum([],5)).to eq(([nil,nil]))
  end
  it 'returns [1,4] or [2,3] for [1,2,3,4,5] and target 7' do
    expect(two_sum([1,2,3,4,5],7)).to eq([1,4]).or eq([2,3])
  end
  it 'returns [0,1] for [1,2,3] and target 3' do
    expect(two_sum([1,2,3],3)).to eq([0,1])
  end
  it 'returns [nil,nil] for [1,4,3] and target 3' do
    expect(two_sum([1,4,3],3)).to eq([nil,nil])
  end
end
