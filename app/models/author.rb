class Author < ApplicationRecord
    has_many :music

    validates :name, presence: true

    def company
        "Sony"
    end
end
