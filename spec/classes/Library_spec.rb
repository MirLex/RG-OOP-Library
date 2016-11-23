require 'spec_helper'

RSpec.describe Library do
  subject(:library) { Library.import(createTestData) }

  context '.new' do
    it 'create new library instance' do
      lib = Library.new(1, 2, 3, 4)
      expect(lib.instance_of?(Library)).to be true
    end
  end

  context '.import' do
    it 'import yaml file' do
      lib = Library.import('./data/library.yaml')
      expect(lib.instance_of?(Library)).to be true
      expect(lib.books.count).to eq(8)
      expect(lib.readers.count).to eq(6)
      expect(lib.authors.count).to eq(6)
      expect(lib.orders.count).to eq(14)
    end
    it 'import serialize file' do
      lib = Library.import('./data/library.dat', 'serialize')
      expect(lib.instance_of?(Library)).to be true
      expect(lib.books.count).to eq(8)
      expect(lib.readers.count).to eq(6)
      expect(lib.authors.count).to eq(6)
      expect(lib.orders.count).to eq(14)
    end
    it 'raise ArgumentError if Incorrect file' do
      expect { Library.import('IncorrectPath') }.to raise_error(ArgumentError)
    end
  end

  context '#export' do
    it 'export obj to Yaml file' do
      library.export('./data/library.yaml')
      expect(File.file?('./data/library.yaml')).to be true
    end
    it 'serialize obj to file' do
      library.export('./data/library.dat', 'serialize')
      expect(File.file?('./data/library.dat')).to be true
    end
  end

  context '#most_active' do
    it 'determines best book' do
      expect(library.most_active_book.first.title).to eq('Ruby Best Practices')
    end
    it 'determines best reader' do
      expect(library.most_active_reader.first.name).to eq('Marvin Duran')
    end
  end

  context '#readers_who_order_popular_book' do
    it 'determines count of readers who ordered popular book' do
      expect(library.count_readers_who_order_popular_book).to eq(4)
    end
  end
end
