# frozen_string_literal: true

require_relative "../bin/main"

describe ".GameManager" do
  context ' grid ["XOX", "OXO", "XXX"]' do
    let(:output) { double("output").as_null_object }
    let(:grid) { GameManager.new(output, %w["XOX", "OXO", "XXX"]) }

      context "#valid_move?" do
        it "X make invalid choice" do

          expect(grid.valid_move?(9)).to be false
        end

          it "current_player should be X" do
            grid.space_filled?(9)
            expect(grid.current_player).to eq(:X)
          end
      end

      context "#board_index" do
        it "should receive invalid choice" do
          output.expect(:puts).with("invalid choice!")
          grid.board_index(9)
        end

        it "current player should be X" do
            expect(grid.current_player).to eq(:X)
        end
      
    end
  end
end
