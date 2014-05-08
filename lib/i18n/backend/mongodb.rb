require 'i18n'

module I18n
  module Backend
    class Mongodb
      include Base, Flatten

      attr_accessor :collection

      def initialize(collection, subtrees = true)
        @collection, @subtrees = collection, subtrees
        collection.indexes.create({key: 1, locale: 1}, {unique: true})
      end

      def store_translations(locale, data, options={})
        escape = options.fetch(:escape, true)
        flatten_translations(locale, data, escape, @subtrees).each do |key, value|
          collection.find(key: key.to_s, locale: locale.to_s).upsert('$set' => { value: value })
        end
      end

      def available_locales
        collection.find.distinct(:locale).map(&:to_sym)
      end

      protected

      def lookup(locale, key, scope=[], options={})
        key   = normalize_flat_keys(locale, key, scope, options[:separator])
        value = collection.find(key: key.to_s, locale: locale.to_s).select(_id: 0, value: 1).first
        value = value[:value] unless value.nil?
        value.is_a?(Hash) ? value.deep_symbolize_keys : value
      end
    end
  end
end
