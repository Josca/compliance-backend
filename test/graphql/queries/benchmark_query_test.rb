# frozen_string_literal: true

require 'test_helper'

class BenchmarkQueryTest < ActiveSupport::TestCase
  test 'query benchmark owned by the user' do
    query = <<-GRAPHQL
      query allBenchmarks {
          allBenchmarks {
              id
              title
              refId
              version
              profiles {
                  id
              }
          }
      }
    GRAPHQL

    users(:test).update account: accounts(:test)

    result = Schema.execute(
      query,
      variables: {},
      context: { current_user: users(:test) }
    )

    assert_equal benchmarks(:one).id,
                 result['data']['allBenchmarks'].first['id']
    assert_equal benchmarks(:one).title,
                 result['data']['allBenchmarks'].first['title']
    assert_equal benchmarks(:one).ref_id,
                 result['data']['allBenchmarks'].first['refId']
    assert_equal benchmarks(:one).version,
                 result['data']['allBenchmarks'].first['version']
  end
end