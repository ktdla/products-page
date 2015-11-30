require 'spec_helper'

module Refinery
  module Productos
    describe Producto do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:producto,
          :nombre => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:nombre) { should == "Refinery CMS" }
      end
    end
  end
end
