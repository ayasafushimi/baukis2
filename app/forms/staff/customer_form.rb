class Staff::CustomerForm
    include ActiveModel::Model

    attr_accessor :customer
    # フォーム送信時のHttpメソッド決定時にpersisted?が呼び出されるため、customerオブジェクトをレシーバとする。
    delegate :persisted?, to: :customer

    def initialize(customer = nil)
        @customer = customer
        @customer ||= Customer.new(gender: "male")
        @customer.build_home_address unless @customer.home_address
        @customer.build_work_address unless @customer.work_address
    end
end