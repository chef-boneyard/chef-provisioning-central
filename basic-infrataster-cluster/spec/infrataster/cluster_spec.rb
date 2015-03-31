require 'spec_helper'

describe server('server1') do
  describe http('http://192.168.20.10/') do
    it 'responds with 200' do
      expect(response.status).to eq 200
    end
  end
end

describe server('server2') do
  describe http('http://192.168.20.11/') do
    it 'responds with 200' do
      expect(response.status).to eq 200
    end
  end
end

describe server('testclient') do
  it 'can wget from server1' do
    result = current_server.ssh_exec('wget http://192.168.20.10/')
    expect(result.chomp).to include '200 OK'
  end

it 'can wget from server2' do
    result = current_server.ssh_exec('wget http://192.168.20.11/')
    expect(result.chomp).to include '200 OK'
  end
end
