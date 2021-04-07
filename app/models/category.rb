class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks, :dependent => :destroy
    validates :category_name, presence: true
    ORDER_OPTIONS = [
        ['Alphabetical (Ascending)', 'item asc'], ['Alphabetical (Descending)', 'item desc'],
        ['First Created', 'created_at asc'], ['Last Created', 'created_at desc'],['Deadline (First)', 'deadline asc'], ['Deadline (Last)', 'deadline desc']
    ].freeze

    def badge_color
        case status
        when 'not-started'
            'danger'
        when 'in-progress'
            'warning'
        else 'completed'
            'success'
        end
    end

    def status
        return 'not-started' if tasks.none?
        #danger

        if tasks.all? { |task| task.complete? }
           return 'completed'
           #success
        elsif tasks.any? { |task| task.in_progress? || task.complete? }
            return 'in-progress'
            #warning
        else
            return 'not-started'
            #danger
        end
    end
    
    def percent_complete
        complete_tasks = tasks.select { |task| task.complete? }.count
        if complete_tasks == 0
            return 0
        end
        ((complete_tasks.to_f / tasks.count) * 100).round
    end

    def total_complete
        tasks.select { |task| task.complete? }.count
    end

    def total_tasks
        tasks.count
    end
end