UserType = GraphQL::ObjectType.define do
  name 'User'
  description '...'
  
  field :id, !types.String
  field :email, !types.String
end

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description '...'
  
  field :user do
    type UserType
    argument :id, !types.String
    resolve -> (root, args, ctx) {
      User.find(args[:id])
    }
  end
end

Schema = GraphQL::Schema.new(
  query: QueryType
)
