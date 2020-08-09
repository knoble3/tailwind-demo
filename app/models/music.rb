class Music < ApplicationRecord
    belongs_to :author

    validates :title, :author, presence: true
end
