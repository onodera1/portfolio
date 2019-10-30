require 'rails_helper'

RSpec.feature "共有内容に関するテスト", type: :feature do
  before do
    @user1 = FactoryBot.create(:user, :create_with_shaings)
    @user2 = FactoryBot.create(:user, :create_with_sharings)
  end
  feature "ログインしていない状態で" do
    feature "以下のページへアクセスした際のリダイレクト先の確認" do
      scenario "sharingの一覧ページ" do
        visit sharings_path
        expect(page).to have_current_path new_user_session_path
      end

      scenario "bookの詳細ページ" do
        visit sharing_path(@user1.sharings.first)
        expect(page).to have_current_path new_user_session_path
      end

      scenario "bookの編集ページ" do
        visit edit_sharing_path(@user1.sharings.first)
        expect(page).to have_current_path new_user_session_path
      end
    end
  end

  feature "ログインした状態で" do
    before do
      login(@user1)
    end
    feature "表示内容とリンクの確認" do
      scenario "sharingの一覧ページの表示内容とリンクは正しいか" do
        visit shasrings_path
        books = Sharing.all
        books.each do |sharing|
          expect(page).to have_link sharing.title,href: sharing_path(shasring)
          expect(page).to have_content sharing.body
        end
        expect(page).to have_link "",href: edit_user_path(@user1)
        expect(page).to have_content @user1.name
      end

      scenario "sharingの一覧ページでtableタグを使用しているか" do
        visit sharings_path
        expect(page).to have_selector "table"
      end

      scenario "自分のshasringの詳細ページでの表示内容とリンクは正しいか" do
        book = @user1.sharrings.first
        visit sharing_path(sharing)
        expect(page).to have_content shraing.title
        expect(page).to have_content sharing.body
        expect(page).to have_link "",href: edit_sharing_path(sharing)
        expect(all("a[data-method='delete']")[-1][:href]).to eq(sharing_path(@user1.sharings.first)) #削除ボタンがあることの確認
        expect(page).to have_link @user1.name,href: user_path(@user1)
        expect(page).to have_link "",href: edit_user_path(@user1)
        expect(page).to have_content @user1.name
      end

      scenario "他人のsharingの詳細ページでの表示内容とリンクは正しいか" do
        book = @user2.sharings.first
        visit sharing_path(sharing)
        expect(page).to have_content sharing.title
        expect(page).to have_content sharing.body
        expect(page).to_not have_link "",href: edit_sharing_path(sharing)
        expect(all("a[data-method='delete']")[-1][:href]).to_not eq(sharing_path(@user1.sharings.first)) #削除ボタンがないことの確認
        expect(page).to have_link @user2.name,href: user_path(@user2)
        expect(page).to have_content @user2.name
      end
    end

    feature "マイページからsharingを投稿" do
      before do
        visit user_path(@user1)
        find_field('book[title]').set("title_a")
        find_field('book[body]').set("body_b")
      end
      scenario "正しく保存できているか" do
        expect {
          find("input[name='commit']").click
        }.to change(@user1.books, :count).by(1)
      end
      scenario "リダイレクト先は正しいか" do
        find("input[name='commit']").click
        expect(page).to have_current_path book_path(Book.last)
        expect(page).to have_content "title_a"
        expect(page).to have_content "body_b"
      end
      scenario "サクセスメッセージが表示されるか" do
        find("input[name='commit']").click
        expect(page).to have_content "successfully"
      end
    end


    feature "有効ではない内容のbookを投稿" do
      before do
        visit user_path(@user1)
        find("input[name='sharing[title]']").set("title_e")
      end
      scenario "保存されないか" do
        expect {
          find("input[name='commit']").click
        }.to change(@user1.books, :count).by(0)
      end
      scenario "リダイレクト先は正しいか" do
        find("input[name='commit']").click
        expect(page).to have_current_path books_path
      end
      scenario "エラーメッセージが表示されるか" do
        find("input[name='commit']").click
        expect(page).to have_content "error"
      end
    end

    feature "自分が投稿したsharingの更新" do
      before do
        sharing = @user1.sharings.first
        visit edit_sharing_path(sharing)
        find_field('sharing[title]').set('update_title_a')
        find_field('sharing[body]').set('update_body_b')
        find("input[name='commit']").click
      end
      scenario "sharingが更新されているか" do
        expect(page).to have_content "update_title_a"
        expect(page).to have_content "update_body_b"
      end
      scenario "リダイレクト先は正しいか" do
        expect(page).to have_current_path sharing_path(@user1.sharings.first)
      end
      scenario "サクセスメッセージが表示されるか" do
        expect(page).to have_content "successfully"
      end
    end

    feature "他人が投稿したsharingの更新" do
      scenario "編集ページへアクセスできず、sharing一覧ページにリダイレクトされるか" do
        visit edit_sharing_path(@user2.sharings.first)
        expect(page).to have_current_path sharings_path
      end
    end

    feature "有効ではない内容のsharingの更新" do
      before do
        sharing = @user1.sharings.first
        visit edit_sharing_path(sharing)
        find_field('sharing[title]').set(nil)
        find("input[name='commit']").click
      end
      scenario "リダイレクト先は正しいか" do
        expect(page).to have_current_path sharing_path(@user1.sharings.first)
      end
      scenario "エラーメッセージが表示されるか" do
        expect(page).to have_content "error"
      end
    end

    feature "sharingの削除" do
      before do
        sharing = @user1.sharings.first
        visit sharing_path(sharing)
      end
      scenario "sharingが削除されているか" do
        expect {
          all("a[data-method='delete']").select{|n| n[:href] == sharing_path(@user1.sharings.first)}[0].click
        }.to change(@user1.sharings, :count).by(-1)
      end
      scenario "リダイレクト先が正しいか" do
        all("a[data-method='delete']").select{|n| n[:href] == sharing_path(@user1.sharings.first)}[0].click
        expect(page).to have_current_path sharings_path
      end
    end
  end
end
