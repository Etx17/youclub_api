module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :activities, [Types::ActivityType], null: false, description: "Returns a list of activities in the database" do
      argument :zipcode, String, required: false
    end
    field :activity, Types::ActivityType, null: true do
      argument :id, ID, required: true
    end

    field :user_by_email, Types::UserType, null: true do
      argument :email, String, required: true
    end

    field :user_by_email_and_sub, Types::UserType, null: true do
      argument :email, String, required: true
      argument :sub_id, String, required: true
    end

    field :sub_groups, [Types::SubGroupType], null: true

    field :clubs, [Types::ClubType], null: true, description: "Returns a list of clubs in the database"

    field :schedules, [Types::ScheduleType], null: true, description: "Returns a list of schedules in the database"

    field :timeSlots, [Types::TimeSlotType], null: true, method: :time_slots, description: "Returns a list of time slots in the database"

    field :club_by_user_id, Types::ClubType, null: true do
      argument :user_id, ID, required: true
    end

    def activity(id:)
      Activity.find(id)
    end

    def activities(zipcode:)
      if zipcode
        Activity.by_zipcode(zipcode)
      else
        Activity.all
      end
    end

    def sub_groups
      object.sub_groups
    end

    def schedules
      object.schedules
    end

    def time_slots
      object.time_slots
    end

    def user_by_email_and_sub(email: nil, sub_id: nil)
      User.find_by(email: email, sub_id: sub_id)
    end

    def user_by_email(email:)
      User.find_by(email: email)
    end

    def club_by_user_id(user_id:)
      Club.find_by(user_id: user_id)
    end

  end
end
