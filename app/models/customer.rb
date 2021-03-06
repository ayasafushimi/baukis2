class Customer < ApplicationRecord
    include EmailHolder
    include PersonalNameHolder
    include PasswordHolder

    # autosave:trueを設定すると、関連づけられたオブジェクトもsaveされる。
    has_one :home_address, dependent: :destroy, autosave: true
    has_one :work_address, dependent: :destroy, autosave: true
    has_many :phones, dependent: :destroy
    # 第二引数にスコープ（付帯条件）を設定する。
    has_many :personal_phones, -> {where(address_id: nil).order(:id)},
        class_name: "Phone", autosave: true

    # inclusionは、値が特定のリストの中にあることを確かめる。
    validates :gender, inclusion: { in: %w(male female), allow_blank: true }
    validates :birthday, date: {
        after: Date.new(1900, 01, 01),
        before: ->(obj) { Date.today },
        allow_blank: true,
    }
end
