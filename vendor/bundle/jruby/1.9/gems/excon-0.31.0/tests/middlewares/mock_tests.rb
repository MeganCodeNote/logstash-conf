Shindo.tests('Excon stubs') do
  env_init

  tests("missing stub").raises(Excon::Errors::StubNotFound) do
    connection = Excon.new('http://127.0.0.1:9292', :mock => true)
    connection.request(:method => :get, :path => '/content-length/100')
  end

  tests("stub({})").raises(ArgumentError) do
    Excon.stub({})
  end

  tests("stub({}, {}) {}").raises(ArgumentError) do
    Excon.stub({}, {}) {}
  end

  tests("stub({:method => :get}, {:body => 'body', :status => 200})") do
    connection = nil
    response = nil

    tests('response.body').returns('body') do
      Excon.stub({:method => :get}, {:body => 'body', :status => 200})

      connection = Excon.new('http://127.0.0.1:9292', :mock => true)
      response = connection.request(:method => :get, :path => '/content-length/100')

      response.body
    end

    tests('response.headers').returns({}) do
      response.headers
    end

    tests('response.status').returns(200) do
      response.status
    end

    tests('request body with response_block given').returns('body') do
      body = ''
      response_block = lambda do |chunk, remaining_bytes, total_bytes|
        body << chunk
      end
      connection.request(:method => :get, :path => '/content-length/100', :response_block => response_block)
      body
    end

    Excon.stubs.clear

  end

  tests("stub({:path => %r{/tests/(\S+)}}, {:body => $1, :status => 200})") do
    connection = nil
    response = nil

    tests('response.body').returns('test') do
      Excon.stub({:path => %r{/tests/(\S+)}}) do |params|
        {
          :body => params[:captures][:path].first,
          :status => 200
        }
      end

      connection = Excon.new('http://127.0.0.1:9292', :mock => true)
      response = connection.request(:method => :get, :path => '/tests/test')

      response.body
    end

    tests('response.headers').returns({}) do
      response.headers
    end

    tests('response.status').returns(200) do
      response.status
    end

    Excon.stubs.clear

  end

  tests("stub({:body => 'body', :method => :get}) {|params| {:body => params[:body], :headers => params[:headers], :status => 200}}") do
    connection = nil
    response = nil

    tests('response.body').returns('body') do
      Excon.stub({:body => 'body', :method => :get}) {|params| {:body => params[:body], :headers => params[:headers], :status => 200}}

      connection = Excon.new('http://127.0.0.1:9292', :mock => true)
      response = connection.request(:body => 'body', :method => :get, :path => '/content-length/100')

      response.body
    end

    tests('response.headers').returns({'Host' => '127.0.0.1:9292', 'User-Agent' => "excon/#{Excon::VERSION}"}) do
      response.headers
    end

    tests('response.status').returns(200) do
      response.status
    end

    tests('request body with response block given').returns('body') do
      body = ''
      response_block = lambda do |chunk, remaining_bytes, total_bytes|
        body << chunk
      end
      connection.request(:body => 'body', :method => :get, :path => '/content-length/100', :response_block => response_block)
      body
    end

    Excon.stubs.clear

  end

  tests("stub({:body => File.open(...), :method => :get}, { :status => 200 })") do

    tests('response.status').returns(200) do
      file_path = File.join(File.dirname(__FILE__), '..', 'data', 'xs')

      Excon.stub(
        { :body => File.read(file_path), :method => :get },
        { :status => 200 }
      )

      connection = Excon.new('http://127.0.0.1:9292', :mock => true)
      response = connection.request(:body => File.open(file_path), :method => :get, :path => '/')

      response.status
    end

    Excon.stubs.clear

  end

  tests("mismatched stub").raises(Excon::Errors::StubNotFound) do
    Excon.stub({:method => :post}, {:body => 'body'})
    Excon.get('http://127.0.0.1:9292/', :mock => true)
  end

  Excon.stubs.clear

  tests("stub({}, {:body => 'x' * (Excon::DEFAULT_CHUNK_SIZE + 1)})") do
    test("with response_block") do
      connection = Excon.new('http://127.0.0.1:9292', :mock => true)
      Excon.stub({}, {:body => 'x' * (Excon::DEFAULT_CHUNK_SIZE + 1)})

      chunks = []
      response_block = lambda do |chunk, remaining_bytes, total_bytes|
        chunks << chunk
      end
      connection.request(:method => :get, :path => '/content-length/100', :response_block => response_block)
      chunks == ['x' * Excon::DEFAULT_CHUNK_SIZE, 'x']
    end
  end

  Excon.stubs.clear

  tests("stub({:url => 'https://user:pass@foo.bar.com:9999/baz?quux=true'}, {:status => 200})") do
    test("get(:expects => 200)") do
      Excon.stub({:url => 'https://user:pass@foo.bar.com:9999/baz?quux=true'}, {:status => 200})
      Excon.new("https://user:pass@foo.bar.com:9999/baz?quux=true", :mock => true).get(:expects => 200)
      true
    end
  end

  Excon.stubs.clear

  tests("stub({}, {:status => 404, :body => 'Not Found'}") do
    connection = nil

    tests("request(:expects => 200, :method => :get, :path => '/')").raises(Excon::Errors::NotFound) do
      connection = Excon.new('http://127.0.0.1:9292', :mock => true)
      Excon.stub({}, {:status => 404, :body => 'Not Found'})

      connection.request(:expects => 200, :method => :get, :path => '/')
    end

    tests("Expects exception should contain response object").returns(Excon::Response) do
      begin
        connection.request(:expects => 200, :method => :get, :path => '/')
      rescue Excon::Errors::NotFound => e
        e.response.class
      end
    end

    test("request(:expects => 200, :method => :get, :path => '/') with block does not invoke the block since it raises an error") do
      block_called = false
      begin
        response_block = lambda do |_,_,_|
          block_called = true
        end
        connection.request(:expects => 200, :method => :get, :path => '/', :response_block => response_block)
      rescue Excon::Errors::NotFound
      end
      !block_called
    end

    Excon.stubs.clear

  end

  tests("stub_for({})") do
    tests("stub_for({})").returns([{}, {}]) do
      Excon.new('http://127.0.0.1:9292', :mock => true)
      Excon.stub({}, {})

      Excon.stub_for({})
    end

    Excon.stubs.clear
  end

  tests("unstub({})") do
    connection = nil

    tests("unstub({})").returns([{}, {}]) do
      connection = Excon.new('http://127.0.0.1:9292', :mock => true)
      Excon.stub({}, {})

      Excon.unstub({})
    end

    tests("request(:method => :get)").raises(Excon::Errors::StubNotFound) do
      connection.request(:method => :get)
    end

    Excon.stubs.clear
  end

  env_restore
end