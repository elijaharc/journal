require 'rails_helper'

RSpec.describe Category, type: :model do
    it { expect(described_class.new).to validate_presence_of :category_name }
  
    describe "#methods" do
      describe "badge_color" do
        context "when case of category's task status is 'not-started'" do
          it "should return 'danger'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'not-started', category_id: category.id)
            expect(category.badge_color).to eq 'danger'
          end
        end

        context "when case of category's task status is 'in-progress'" do
          it "should return 'warning'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'in-progress', category_id: category.id)
            expect(category.badge_color).to eq 'warning'
          end
        end

        context "when case of category's task status is 'completed'" do
          it "should return 'success'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'completed', category_id: category.id)
            expect(category.badge_color).to eq 'success'
          end
        end
      end

      describe "status" do
        context "when the category has 0 tasks" do
          it "the category badge should be 'not-started'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            expect(category.status).to eq 'not-started'
          end
        end

        context "when all the tasks in category is marked completed" do
          it "the category badge should be 'completed'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'completed', category_id: category.id)
            task2 = Task.create(item: 'test2', status: 'completed', category_id: category.id)
            expect(category.status).to eq 'completed'
          end
        end

        context "when at least 1 task in category is marked 'in-progress'" do
          it "the category badge should be 'in-progress'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'completed', category_id: category.id)
            task2 = Task.create(item: 'test2', status: 'in-progress', category_id: category.id)
            expect(category.status).to eq 'in-progress'
          end
        end

        context "when all the tasks in category is marked 'not-started'" do
          it "the category badge should be 'not-started'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'not-started', category_id: category.id)
            task2 = Task.create(item: 'test2', status: 'not-started', category_id: category.id)
            expect(category.status).to eq 'not-started'
          end
        end
      end

      describe "percent_complete" do
        context "if there are 0 tasks marked 'completed'" do
          it "should return 0'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'not-started', category_id: category.id)
            expect(category.percent_complete).to eq 0
          end
        end

        context "if all the tasks are marked 'completed'" do
          it "should return 100'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'completed', category_id: category.id)
            expect(category.percent_complete).to eq 100
          end
        end

        context "if half of tasks is marked 'completed'" do
          it "should return 50'" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'completed', category_id: category.id)
            task = Task.create(item: 'test1', status: 'in-progress', category_id: category.id)
            expect(category.percent_complete).to eq 50
          end
        end
      end

      describe "total_complete" do
        context "if there are 0 tasks marked 'completed' in category" do
          it "should count 0" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'not-started', category_id: category.id)
            expect(category.total_complete).to eq 0
          end
        end

        context "if there is 1 task marked 'completed' in category" do
          it "should count 1" do
            user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
            category = Category.create(category_name: 'test1', user_id: user.id)
            task = Task.create(item: 'test1', status: 'not-started', category_id: category.id)
            task = Task.create(item: 'test1', status: 'completed', category_id: category.id)
            expect(category.total_complete).to eq 1
          end
        end

        describe "total_tasks" do
          context "all the tasks in the category" do
            it "should count number of tasks created" do
              user = User.create(email: "elijah@elijah.com", username: "elijaharc", first_name: "Elijah", last_name: "Arc", password: 'password')
              category = Category.create(category_name: 'test1', user_id: user.id)
              task = Task.create(item: 'test1', status: 'not-started', category_id: category.id)
              expect(category.total_tasks).to eq 1
            end
          end
        end
      end
    end
  end