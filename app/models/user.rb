class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :subject
  belongs_to :prefecture
  belongs_to :operation
  belongs_to :schooltype

  has_many :topics
  has_many :sns_credentials, dependent: :destroy
  has_many :comments

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角日本語を使用してください' } do
    validates :name
  end

  validates :age_id, :subject_id, :prefecture_id, :operation_id, :schooltype_id,  numericality: { other_than: 1 , message: "を選択してください"}
  
  validates :school_name, presence: true

end
