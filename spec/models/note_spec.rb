require 'spec_helper'

describe Note do
  it { should belong_to(:project) }
  it { should belong_to(:tag) }

  it { should validate_presence_of :value }
  it { should validate_presence_of :project }
  it { should validate_presence_of :tag }
end
