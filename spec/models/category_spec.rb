require 'rails_helper'

RSpec.describe Category, type: :model do
  it { expect(described_class.new).to validate_presence_of :category_name }
  
    describe "#methods" do
      describe "badge_color" do
        context "when case of category's task status is 'not-started'" do
          let!(:task) { FactoryBot.create(:task, :not_started) }
          it "should return 'danger'" do
            expect(task.category.badge_color).to eq 'danger'
          end
        end

        context "when case of category's task status is 'in-progress'" do
          let!(:task) { FactoryBot.create(:task, :in_progress) }
          it "should return 'warning'" do
            expect(task.category.badge_color).to eq 'warning'
          end
        end

        context "when case of category's task status is 'completed'" do
          let!(:task) { FactoryBot.create(:task, :completed) }
          it "should return 'success'" do
            expect(task.category.badge_color).to eq 'success'
          end
        end
      end

      describe "status" do
        context "when the category has 0 tasks" do
          let!(:category) { FactoryBot.create(:category) }
          it "the category badge should be 'not-started'" do
            expect(category.status).to eq 'not-started'
          end
        end

        context "when all the tasks in category is marked completed" do
          let!(:task) { FactoryBot.create(:task, :completed) }
          it "the category badge should be 'completed'" do
            task2 = Task.create(item: 'test2', status: 'completed', category_id: task.category.id)
            expect(task.category.status).to eq 'completed'
          end
        end

        context "when at least 1 task in category is 'in-progress' or at least 1 is 'completed'" do
          let!(:task) { FactoryBot.create(:task, :not_started) }
          it "the category badge should be 'in-progress'" do
            task2 = Task.create(item: 'test2', status: 'completed', category_id: task.category.id)
            expect(task.category.status).to eq 'in-progress'
          end
        end

        context "when all the tasks in category is marked 'not-started'" do
          let!(:task) { FactoryBot.create(:task, :not_started) }
          it "the category badge should be 'not-started'" do
            task2 = Task.create(item: 'test2', status: 'not-started', category_id: task.category.id)
            expect(task.category.status).to eq 'not-started'
          end
        end
      end

      describe "percent_complete" do
        context "if there are 0 tasks marked 'completed'" do
          let!(:task) { FactoryBot.create(:task, :not_started) }
          it "should return 0'" do
            expect(task.category.percent_complete).to eq 0
          end
        end

        context "if all the tasks are marked 'completed'" do
          let!(:task) { FactoryBot.create(:task, :completed) }
          it "should return 100'" do
            expect(task.category.percent_complete).to eq 100
          end
        end

        context "if half of tasks is marked 'completed'" do
          let!(:task) { FactoryBot.create(:task, :completed) }
          it "should return 50'" do
            task2 = Task.create(item: 'test2', status: 'not-started', category_id: task.category.id)
            expect(task.category.percent_complete).to eq 50
          end
        end
      end

      describe "total_complete" do
        context "if there are 0 tasks marked 'completed' in category" do
          let!(:task) { FactoryBot.create(:task, :not_started) }
          it "should count 0" do
            expect(task.category.total_complete).to eq 0
          end
        end

        context "if there is 1 task marked 'completed' in category" do
          let!(:task) { FactoryBot.create(:task, :completed) }
          it "should count 1" do
            expect(task.category.total_complete).to eq 1
          end
        end
      end

      describe "total_tasks" do
        context "all the tasks in the category" do
          let!(:task) { FactoryBot.create(:task, :completed) }
          it "should count number of tasks created" do
            task2 = Task.create(item: 'test2', status: 'not-started', category_id: task.category.id)
            expect(task.category.total_tasks).to eq task.category.tasks.count
          end
        end
      end
    end
  end