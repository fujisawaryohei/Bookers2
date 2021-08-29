require 'rails_helper'

RSpec.describe BooksController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:book) { FactoryBot.create(:book, user: user) }
  
  context 'ログインしている場合' do
    before do
      sign_in user
    end

    let(:book_params) do
      {
        user_id: user.id,
        title: 'テストタイトル',
        body: 'とてもよかった'
      }
    end

    describe 'GET /books' do
      it '本一覧ページを返す' do
        get books_path
        expect(response.status).to eq 200
      end
    end
  
    describe 'GET /books/:id' do
      it '本詳細ページを返す' do
        get book_path(book)
        expect(response.status).to eq 200
      end
    end
  
    describe 'GET /books/:id/edit' do
      it '本の編集ページを返す' do
        get book_path(book)
        expect(response.status).to eq 200
      end
    end
  
    describe 'POST /books' do
      it '本を登録する' do
        expect{
          post books_path(params: { book: book_params })
        }.to change { Book.all.count }.by(1)
      end
    end
  
    describe 'PATCH /books/:id' do
      it '本を更新する' do
        patch book_path(book, params: { book: book_params })
        book.reload
        expect(Book.first.title).to eq 'テストタイトル'
      end
    end
  
    describe 'DELETE /books/:id' do
      it '本を削除する' do
        expect{
          delete book_path(book)
        }.to change { Book.all.count }.by(-1)
      end
    end
  end
end