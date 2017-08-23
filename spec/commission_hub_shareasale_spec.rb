require 'spec_helper'

describe CommissionHub do
  it 'has a version number' do
    expect(CommissionHub::ShareasaleV22::VERSION).not_to be nil
  end

  describe CommissionHub::ShareasaleV22::Settings do
    it 'has a base_uri' do
      expect(CommissionHub::ShareasaleV22::Settings.new).to respond_to(:base_uri)
    end

    it 'has an api_token' do
      expect(CommissionHub::ShareasaleV22::Settings.new).to respond_to(:api_token)
    end
  end
end
