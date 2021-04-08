require 'rails_helper'

RSpec.describe Task, type: :model do
  it { expect(described_class.new).to validate_presence_of :item }
  it { should validate_inclusion_of(:status).in_array(['not-started', 'in-progress', 'completed']) }

  describe "#methods" do
    describe "badge_color" do
      context "when case of task status is 'not-started'" do
        let!(:task) { FactoryBot.create(:task, :not_started) }
        it "should return 'danger'" do
          expect(task.badge_color).to eq 'danger'
        end
      end

      context "when case of task status is 'in-progress'" do
        let!(:task) { FactoryBot.create(:task, :in_progress) }
        it "should return 'warning'" do
          expect(task.badge_color).to eq 'warning'
        end
      end

      context "when case of task status is 'completed'" do
        let!(:task) { FactoryBot.create(:task, :completed) }
        it "should return 'success'" do
          expect(task.badge_color).to eq 'success'
        end
      end
    end

    describe "complete?" do
      context "a task in a category is marked 'completed'" do
        let!(:task) { FactoryBot.create(:task, :completed) }
        it "task's status should be 'completed'" do
          task2 = Task.create(item: 'test2', status: 'not-started', category_id: task.category.id)
          expect(task.complete?).to be_truthy
        end
      end
    end

    describe "in_progress?" do
      context "a task in a category is marked 'in-progress'" do
        let!(:task) { FactoryBot.create(:task, :in_progress) }
        it "task's status should be 'in-progress'" do
          expect(task.in_progress?).to be_truthy
        end
      end
    end

    describe "not-started?" do
      context "a task in a category is marked 'not-started'" do
        let!(:task) { FactoryBot.create(:task, :not_started) }
        it "task's status should be 'not-started'" do
          expect(task.not_started?).to be_truthy
        end
      end
    end
  end
end

