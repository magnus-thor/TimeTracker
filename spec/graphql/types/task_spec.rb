RSpec.describe Types::TaskType do
  types = GraphQL::Define::TypeDefiner.instance

  it 'has an :id field of ID type' do
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it 'has a :title field of String type' do
    expect(subject).to have_field(:title).that_returns(!types.String)
  end

  it 'has a :title field of String type' do
    expect(subject).to have_field(:description).that_returns(!types.String)
  end

  it 'has a :title field of String type' do
    expect(subject).to have_field(:duration).that_returns(!types.Float)
  end
end
