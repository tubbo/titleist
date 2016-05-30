require 'rails_helper'

module Titleist
  RSpec.describe Title do
    subject do
      described_class.new(
        controller: 'posts',
        action: 'show',
        context: { name: 'Test' }
      )
    end

    describe '#app' do
      it 'finds app title from i18n' do
        expect(subject.app).to eq 'App'
      end

      it 'guesses default app title when not found' do
        allow(I18n).to receive(:t).with(:application, name: 'Test', scope: :titles, default: 'Dummy').and_return('Dummy')
        expect(subject.app).to eq 'Dummy'
      end
    end

    describe '#page' do
      it 'finds page title from i18n' do
        expect(subject.page).to eq 'View "Test"'
      end

      it 'titleizes scope when not found' do
        allow(I18n).to receive(:t).with(:show, name: 'Test', scope: [:titles, 'posts'], default: 'View Post').and_return('Show Post')
        expect(subject.page).to eq 'Show Post'
      end

      it 'uses overridden title' do
        subject.page = 'Override'
        expect(subject.page).to eq('Override')
        expect(subject.to_s).to eq('Override | App')
      end
    end

    describe '#to_s' do
      it 'generates the full title from i18n' do
        expect(subject.to_s).to eq('View "Test" | App')
      end

      it 'only shows app title on root path' do
        allow(subject).to receive(:app).and_return 'App'
        allow(subject).to receive(:root?).and_return true
        expect(subject.to_s).to eq('App')
      end
    end

    describe '#to_h' do
      it 'compiles i18n context from attributes' do
        expect(subject.to_h).to eq(
          scope: Title::ROOT_SCOPE,
          app: 'App',
          page: 'View "Test"'
        )
      end
    end
  end
end
