class User < ApplicationRecord
    enum role: { normal: 0, admin: 1 }
end
