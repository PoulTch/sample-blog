require "rails_helper"

describe Article do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end

  describe "association" do
    it { should have_many(:comments).dependent(:destroy)  }
  end

  describe "#subject" do
    it "returns the article title" do
      # создаем объект article хитрым способом
      article = create(:article, title: 'Lorem Ipsum')

      # assert, проверка
      expect(article.subject).to eq 'Lorem Ipsum'
    end
  end

  describe "#last_comment" do
    it "returns the last comment" do
      #создаем статью, но в этот раз с комментариями
      article = create(:article_with_comments)

      #проверка
      expect(article.last_comment.body).to eq "comment body 3"
    end
  end

  describe Article, type: :model do
    it { should validate_length_of(:title).is_at_most(140) }
    it { should validate_length_of(:text).is_at_most(4000) }
  end
end