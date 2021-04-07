require 'rails_helper'

RSpec.describe Task, type: :model do
  it { expect(described_class.new).to validate_presence_of :item }
  it { should validate_inclusion_of(:status).in_array(['not-started', 'in-progress', 'completed']) }

  describe "#methods" do
    describe "badge_color" do
      context "when case of task status is 'not-started'" do
        it "should return 'danger'" do
          user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
          category = Category.create(category_name: 'test1', user_id: user.id)
          task = Task.create(item: 'test1', status: 'not-started', category_id: category.id)
          expect(task.badge_color).to eq 'danger'
        end
      end

      context "when case of task status is 'in-progress'" do
        it "should return 'warning'" do
          user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
          category = Category.create(category_name: 'test1', user_id: user.id)
          task = Task.create(item: 'test1', status: 'in-progress', category_id: category.id)
          expect(task.badge_color).to eq 'warning'
        end
      end

      context "when case of task status is 'completed'" do
        it "should return 'success'" do
          user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
          category = Category.create(category_name: 'test1', user_id: user.id)
          task = Task.create(item: 'test1', status: 'completed', category_id: category.id)
          expect(task.badge_color).to eq 'success'
        end
      end
    end

    describe "complete?" do
      context "any task in a category" do
        it "should set task's status to 'completed'" do
          user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
          category = Category.create(category_name: 'test1', user_id: user.id)
          task = Task.create(item: 'test1', status: 'completed', category_id: category.id)
          expect(task.complete?).to be_truthy
        end
      end
    end

    describe "in_progress?" do
      context "any task in a category" do
        it "should set task's status to 'in-progress'" do
          user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
          category = Category.create(category_name: 'test1', user_id: user.id)
          task = Task.create(item: 'test1', status: 'in-progress', category_id: category.id)
          expect(task.in_progress?).to be_truthy
        end
      end
    end

    describe "in_progress?" do
      context "any task in a category" do
        it "should set task's status to 'not-started'" do
          user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
          category = Category.create(category_name: 'test1', user_id: user.id)
          task = Task.create(item: 'test1', status: 'not-started', category_id: category.id)
          expect(task.not_started?).to be_truthy
        end
      end
    end
  end
end

