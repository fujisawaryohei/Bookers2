class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Relation
  has_many :books

  # Validation
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }, allow_blank: true

  # deviseのvalidatableのpassword_confirmationをオーバーライドしてバリデーションをカスタマイズ
  # 編集時にのみパスワードと確認用パスワードは任意にするようにする
  def password_required?
    new_record? || (persisted? && (password.present? || password_confirmation.present?))
  end

  # Refile
  attachment :profile_image
end
