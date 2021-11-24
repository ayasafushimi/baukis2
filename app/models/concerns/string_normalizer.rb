require "nkf"

module StringNormalizer
    extend ActiveSupport::Concern

    def normalize_as_email(text)
        # 全角英数字と記号とスペースを半角に変換し、先頭と末尾の空白を除去している。
        NKF.nkf("-W -w -Z1", text).strip if text
    end

    def normalize_as_name(text)
        # 全角英数字と記号とスペースを半角に変換し、先頭と末尾の空白を除去している。
        NKF.nkf("-W -w -Z1", text).strip if text
    end
        # 全角英数字と記号とスペースを半角に変換し、先頭と末尾の空白を除去している。
        # ひらがなをカタカナに変換している。
    def normalize_as_furigana(text)
        NKF.nkf("-W -w -Z1 --katakana", text).strip if text
    end

    def normalize_as_postal_code(text)
        NKF.nkf("-W -w -Z1", text).strip.gsub(/-/, "") if text
    end
end