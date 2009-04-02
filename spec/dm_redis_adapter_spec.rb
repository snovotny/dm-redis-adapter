require File.dirname(__FILE__) + '/spec_helper'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib/redis_adapter.rb'))
require 'dm-core/spec/adapter_shared_spec'

describe DataMapper::Adapters::RedisAdapter do
  before(:all) do
    @adapter = DataMapper.setup(:default, {
      :adapter  => "redis",
      :database => 15
    })
  end
  
  it_should_behave_like 'An Adapter'

  after(:all) do
    # Ghetto delete all
    r = Redis.new
    r.keys('*').each {|k| r.delete k }
  end
end