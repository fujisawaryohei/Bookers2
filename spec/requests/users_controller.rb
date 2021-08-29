require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:user) { FactoryBot.create(:user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    let(:user_params) do
      {
        name: 'テスト太郎',
        email: 'user1@example.com',
        password: 'test123456',
        password_confirmation: 'test123456'
      }
    end

    describe 'GET /users' do
      it 'ユーザー一覧ページを返す' do
        get '/'
        expect(response.status).to eq 200
      end
    end
  
    describe 'GET /users/:id' do
      it 'ユーザー詳細ページを返す' do
        get user_path(user)
        expect(response.status).to eq 200
      end
    end
  
    describe 'GET /users/:id/edit' do
      it 'ユーザー編集ページを返す' do
        get edit_user_path(user)
        expect(response.status).to eq 200
      end
    end

    describe 'PATCH /users/:id' do
      it 'ユーザー情報を更新する' do
        patch user_path(user, params: { user: user_params })
        user.reload
        expect(user.name).to eq 'テスト太郎'
      end
    end

    describe 'DELETE /users/:id' do
      it 'ユーザーを削除する' do
        expect{
          delete user_path(user)
        }.to change { User.all.count }.by(-1)
      end      
    end
  end
end