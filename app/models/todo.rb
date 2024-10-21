class Todo < ApplicationRecord
    enum :status, { incomplete: 0, complete: 1 }
    belongs_to :category
    validates_presence_of :name
end
