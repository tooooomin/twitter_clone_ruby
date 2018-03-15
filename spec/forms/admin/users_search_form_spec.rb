# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::UsersSearchForm do
  describe '#search' do

    context 'with no params' do
      it 'returns no users' do
        form = Admin::UsersSearchForm.new()
        expect(form.search.size).to eq(0)
      end
    end
    context 'with email param' do
      it 'return user by email' do
        create(:user, email: 'test@example.com')
        create(:user, email: 'foo@test.com')
        form = Admin::UsersSearchForm.new(search_text: 'example')
        expect(form.search.size).to eq(1)
      end
    end
    context 'with screen_name param' do
      it 'return user by screen_name' do
        create(:user, screen_name: 'Toooooomin')
        create(:user, screen_name: 'Sasaki')
        form = Admin::UsersSearchForm.new(search_text: 'ooooo')
        expect(form.search.size).to eq(1)
      end
    end
    context 'with screen_name and email params' do
      it 'return user by email and screen_name' do
        create(:user, email: 'test@example.com', screen_name: 'Toooooomin')
        create(:user, email: 'foo@test.com', screen_name: 'Sasakicom')
        form = Admin::UsersSearchForm.new(search_text: 'com')
        expect(form.search.size).to eq(2)
      end
    end

  end
end