require 'spec_helper'

describe Authorization do
  context "required attributes" do
    context "uid" do
      subject {FactoryGirl.build :authorization, uid: nil}
      it { expect(subject.save).to be_false }
    end
  end

  context "unique attributes" do
    context "uid" do
      before do
        FactoryGirl.create :authorization, uid: "12345"
      end
      subject {FactoryGirl.build :authorization, uid: "12345"}
      it { expect(subject.save).to be_false }
    end
  end
end
