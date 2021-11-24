class Customer < ApplicationRecord
    # autosave:trueを設定すると、関連づけられたオブジェクトもsaveされる。
    has_one :home_address, dependent: :destroy, autosave: true
    has_one :work_address, dependent: :destroy, autosave: true

    # inclusionは、値が特定のリストの中にあることを確かめる。
    validates :gender, inclusion: { in: %w(male female), allow_blank: true }
    validates :birthday, date: {
        after: Date.new(1900, 01, 01),
        before: ->(obj) { Date.today },
        allow_blank: true,
    }
    def password=(raw_password)
        if raw_password.kind_of?(String)
            self.hashed_password = BCrypt::Password.create(raw_password)
        elsif raw_password.nil?
            self.hashed_password = nil
        end
    end
end
