class Task < ApplicationRecord
    validates :item, presence: true
end
