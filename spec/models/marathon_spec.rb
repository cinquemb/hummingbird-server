# rubocop:disable Metrics/LineLength
# == Schema Information
#
# Table name: marathons
#
#  id               :integer          not null, primary key
#  ended_at         :datetime
#  rewatch          :boolean          not null
#  started_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  library_entry_id :integer          not null
#
# Foreign Keys
#
#  fk_rails_786c203114  (library_entry_id => library_entries.id)
#
# rubocop:enable Metrics/LineLength

require 'rails_helper'

RSpec.describe Marathon, type: :model do
  it { should have_many(:marathon_events).dependent(:destroy) }
  it { should belong_to(:library_entry) }
end
