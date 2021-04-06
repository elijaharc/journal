class Task < ApplicationRecord
    validates :item, presence: true
    validates :status, inclusion: { in: ['not-started', 'in-progress', 'completed']}
    belongs_to :category
    STATUS_OPTIONS = [
        ['Not started', 'not-started'],
        ['In progress', 'in-progress'], ['Completed', 'completed']
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

    def complete?
        status == 'completed'
    end

    def in_progress?
        status == 'in-progress'
    end

    def not_started?
        status == 'not-started'
    end
end
 