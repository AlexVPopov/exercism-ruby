# frozen_string_literal

require 'break'

class BookStore
  BASE_PRICE = 8

  DISCOUNT_FACTOR = {
    0 => 0.0,
    1 => 1.0,
    2 => 0.95,
    3 => 0.90,
    4 => 0.80,
    5 => 0.75
  }.freeze

  class << self
    def calculate_price(basket, bundles = [])
      basket.empty? ? total_price(bundles) : bundle_basket(basket, bundles)
    end

    private

    def bundle_basket(basket, bundles)
      basket = order_by_frequency(basket) if bundles.empty?

      book, *remaining_books = basket

      bundle = optimal_bundle_for_cheapest_basket(bundles, book)

      bundle.push(book)

      calculate_price(remaining_books, bundles)
    end

    def optimal_bundle_for_cheapest_basket(bundles, book)
      bundles_not_containing_book =
        bundles.push([]).reject { |bundle| bundle.include?(book) }

      bundles_not_containing_book.min_by.with_index do |bundle, i|
        current_bundles = bundles_not_containing_book.clone

        current_bundles[i] = [*bundle, book]

        total_price(current_bundles)
      end
    end

    def total_price(bundles)
      bundles.map(&method(:bundle_price)).sum
    end

    def bundle_price(bundle)
      bundle.count * BASE_PRICE * DISCOUNT_FACTOR[bundle.count]
    end

    def order_by_frequency(basket)
      basket.group_by(&:itself)
            .values
            .sort_by(&:count)
            .reverse
            .flatten
    end
  end
end
