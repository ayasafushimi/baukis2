class ModelPresenter
    # モデルを対象としたプレゼンテーター

    # HTML生成モジュールを導入
    include HtmlBuilder

    attr_reader :object, :view_context

    # メソッドをview_contextに委譲する。
    delegate :raw, :link_to, to: :view_context

    def initialize(object, view_context)
        @object = object
        # view_contextは、Railsで定義されたすべてのヘルパーメソッドを自分のメソッドとして持っている。
        @view_context = view_context
    end

    def created_at
        object.created_at.try(:strftime, "%Y/%m/%d %H:%M:%S")
    end

    def updated_at
        object.updated_at.try(:strftime, "%Y/%m/%d %H:%M:%S")
    end
end