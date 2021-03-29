class Task < ApplicationRecord
    validates :item, presence: true
    validates :status, inclusion: { in: ['not-started', 'in-progress', 'complete']}
    belongs_to :category
    STATUS_OPTIONS = [
        ['Not started', 'not-started'], ['In progress', 'in-progress'], ['Complete', 'complete']
    ]
end
 