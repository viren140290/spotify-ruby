# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spotify::SDK::Connect do
  let(:connect_sdk) { Spotify::SDK.new("access_token").connect }

  describe "#devices" do
    before(:each) { stub_spotify_api_request(:get, "/v1/me/player/devices") }
    let(:devices) { connect_sdk.devices }

    it "should return an list of devices" do
      expect(devices).to be_kind_of(Array)
    end

    it "should contain the correct values" do
      device = devices[0]
      expect(device).to be_kind_of(Spotify::SDK::Connect::Device)
      expect(device.id).to eq "941223d904f006c4d998598272d43d94"
      expect(device.is_active).to eq true
      expect(device.is_restricted).to eq false
      expect(device.name).to eq "Bilawal’s MacBook Pro"
      expect(device.type).to eq "Computer"
      expect(device.volume_percent).to eq 100
    end
  end
end