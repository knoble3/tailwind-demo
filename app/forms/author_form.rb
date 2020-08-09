class AuthorForm
    include ActiveModel::Model

    delegate :attributes=, to: :music, prefix: true
    delegate :attributes=, to: :author, prefix: true

    attr_reader :author, :music

    # validate :author_is_john

    def initialize(params={})
        @author = Author.new
        @music = @author.music.build
        super(params)
    end

    def save
        return false unless valid?
        
        ActiveRecord::Base.transaction do
            @author.save!
            @music.save!

            true
        rescue ActiveRecord::RecordInvalid
            false
        end
    end

    def title
        "To create author form"
    end

    # def author_is_john
    #     if @author.name != "John"
    #         errors.add(:base, "not John") 
    #         @author.errors.add(:name, "not John")
    #     end
    # end
end