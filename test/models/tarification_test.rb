# == Schema Information
#
# Table name: tarifications
#
#  id           :bigint           not null, primary key
#  amount       :integer
#  recurrence   :string
#  label        :string
#  description  :string
#  sub_group_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class TarificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
