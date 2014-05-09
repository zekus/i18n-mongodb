require File.expand_path('../test_helper', __FILE__)
require 'i18n/tests'
require 'i18n/backend/mongodb'
require 'moped'

class I18nMongodbTest < Test::Unit::TestCase
  def setup
    session = Moped::Session.new(["127.0.0.1:27017"])
    session.use('test')
    @collection = session[:translations]
    I18n.backend = I18n::Backend::Mongodb.new(@collection)
    super
  end
  
  def teardown
    @collection.drop
    super
  end
  
  test "make sure we use a MongoDB backend" do
    assert_equal I18n::Backend::Mongodb, I18n.backend.class
  end

  def self.can_store_procs?
    false
  end

  include I18n::Tests::Basics
  include I18n::Tests::Defaults
  include I18n::Tests::Interpolation
  include I18n::Tests::Link
  include I18n::Tests::Lookup
  include I18n::Tests::Pluralization
  include I18n::Tests::Procs if can_store_procs?

  include I18n::Tests::Localization::Date
  include I18n::Tests::Localization::DateTime
  include I18n::Tests::Localization::Time
  include I18n::Tests::Localization::Procs if can_store_procs?
end
