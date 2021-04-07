require 'rails_helper'

RSpec.describe User, type: :model do
    it { expect(described_class.new).to validate_presence_of :username }
    it { expect(described_class.new).to validate_presence_of :first_name }
    it { expect(described_class.new).to validate_presence_of :last_name }
    it { expect(described_class.new).to validate_uniqueness_of(:username).case_insensitive }
    it { expect(described_class.new).to validate_confirmation_of :password }
end