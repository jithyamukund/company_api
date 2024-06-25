class Company < ApplicationRecord

  validates :company_name, presence: true, length: { minimum: 5 }
  validates :email_id, presence: true, format: { with: /\A[a-z]+@[a-z]+\.[a-z]+\z/ }
  validates :company_code, uniqueness: true, length: { is: 5}, format: { with: /\A[A-Za-a]{2}[0-9]{2}[EN]\z/ }
  validates :website, format: { with: /\Awww\.[A-Za-z]+\.[A-za-z]+\z/ }
end
