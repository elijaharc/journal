require 'rails_helper'

RSpec.describe Category, type: :model do
    it { expect(described_class.new).to validate_presence_of :category_name }
  
    describe "#methods" do
      describe "badge_color" do
        context "when case of task status is 'not-started'" do
          it "should return 'danger'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'not-started', category_id: category.id)
            expect(category.badge_color).to eq 'danger'
          end
        end

        context "when case of task status is 'in-progress'" do
          it "should return 'warning'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'in-progress', category_id: category.id)
            expect(category.badge_color).to eq 'warning'
          end
        end

        context "when case of task status is 'completed'" do
            it "should return 'success'" do
              user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
              category = Category.create(category_name: 'test1', user_id: user.id)
              task = Task.create(item: 'test1', status: 'completed', category_id: category.id)
              expect(category.badge_color).to eq 'success'
            end
          end
      end
    end
  end