require 'spec_helper'

describe Photo do

  it { should belong_to(:album) }
  it { should validate_presence_of(:album_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:image) }
  it { should allow_value("My Photo Name").for(:name) }
  it { should_not allow_value("a" * 201).for(:name) }


end