class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relation
  has_many :books, dependent: :destroy

  # Validation
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }, allow_blank: true
  validates :email, length: { maximum: 50 }, allow_blank: true

  # deviseのvalidatableのpassword_confirmationをオーバーライドしてバリデーションをカスタマイズ
  # 編集時にのみパスワードと確認用パスワードは任意入力にする
  def password_required?
    new_record? || (persisted? && (password.present? || password_confirmation.present?))
  end

  # Refile
  attachment :profile_image
end
