require "rails_helper"

describe Comment do
  it { should belong_to(:article)  }
end

  describe Comment, type: :model do
    it { should validate_length_of(:body).is_at_most(4000) }
  end