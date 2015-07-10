require 'grape'

module SchoolTest
  module Entities

    class Klass < Grape::Entity
      expose :id
      expose :name, :documentation => {:type => "string", :desc => "Klass name"}
    end
  end
end