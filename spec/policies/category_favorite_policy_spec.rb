require 'rails_helper'

RSpec.describe CategoryFavoritePolicy do
  let(:user) { token_for build(:user) }
  let(:favorite) { build(:category_favorite, user: user.resource_owner) }
  let(:other) { build(:category_favorite) }
  subject { described_class }

  permissions :update?, :create?, :destroy? do
    it('should allow user') { should permit(user, favorite) }
    it('should not allow other') { should_not permit(user, other) }
  end
end