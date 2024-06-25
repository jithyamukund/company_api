require 'rails_helper'

RSpec.describe Company, type: :model do

  let(:company) { Company.new(company_name: 'testing1', email_id: 'testing@gmail.com', company_code: 'TE13E', strength: 200, website: 'www.testing.com') }

  describe 'validations' do
    it 'is valid with valid inputs' do
      expect(company).to be_valid
    end

    it 'is invalid if company name length is less than 5' do
      company.company_name = 'test'
      expect(company).not_to be_valid
    end

    it 'is invalid with invalid email format' do
      company.email_id = 'testing.gmail@com'
      expect(company).not_to be_valid
    end

    context 'is invalid with invalid company code' do
      it 'is invalid if length is not 5' do
        company.company_code = 'TE13ET'
        expect(company).not_to be_valid
      end

      it 'is invalid if last letter not E or N' do
        company.company_code = 'TE13A'
        expect(company).not_to be_valid
      end

      it 'is invalid if 1st and Second letters are not alphabets' do
        company.company_code = '1A13E'
        expect(company).not_to be_valid
      end

      it 'is invalid if 3rd and 4th letters are not numbers' do
        company.company_code = 'TE1AE'
        expect(company).not_to be_valid
      end
    end

  end
end
