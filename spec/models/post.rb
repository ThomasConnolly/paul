describe Post do 
  it 'has valid content' do
    expect(build(:content)).to be_valid
  end

  it 'is invalid without a user_id' do
    expect(build(:user_id)).to be_valid
  end
end
end
