# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  name       :string
#  flag_emoji :string
#  capital    :string
#  population :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
