class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :email_id
      t.string :company_code
      t.integer :strength
      t.string :website

      t.timestamps
    end
  end
end
