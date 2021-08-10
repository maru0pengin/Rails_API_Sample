require 'rails_helper'

RSpec.describe Post, type: :model do
  context "タイトルと内容が入力されている場合" do
    let!(:post) do
      Post.new({title: "Rspecのテスト", content:"Rspecにトライしてみよう！"})
    end
    it '記事を保存できる' do
      expect(post).to be_valid
    end
  end
end