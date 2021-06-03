class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #ニックネームと誕生日のバリデーション
         validates :nickname, presence: true
         validates :birthday, presence: true
 
        #名前のバリテーション（姓名）
        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
          validates :first_name
          validates :last_name
        end

       #名前のバリテーション（カナ）
        with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角(カタカナ）を使用してください' } do
          validates :first_name_ruby
          validates :last_name_ruby
        end

        #パスワードのバリデーション
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

end
