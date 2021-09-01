require 'rails_helper'

RSpec.describe HomesController, type: :request do
  describe 'GET /' do
    it 'トップページを返す' do
      get '/'
      expect(response.status).to eq 200
    end
  end

  describe 'GET /homes/about' do
    it 'Aboutページを返す' do
      get home_about_path
      expect(response.status).to eq 200
    end
  end
end