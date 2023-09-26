# frozen_string_literal: true

describe ConsoleOutput do
  let(:journey) { double(:journey) }
  let(:journey_option1) { double(:journey_option) }
  let(:journey_option2) { double(:journey_option) }

  before(:each) do
    journey_sequence_descriptions = [
      { description: 'journey section description' },
      { description: 'journey section description' }
    ]

    allow(journey).to receive(:description).and_return({ description: 'journey description values' })
    allow(journey).to receive(:journey_options) { [journey_option1, journey_option2] }

    allow(journey_option1).to receive(:description).and_return({ description: 'option1 description values' })
    allow(journey_option2).to receive(:description).and_return({ description: 'option2 description values' })

    allow(journey_option1).to receive(:journey_sequence_descriptions) { journey_sequence_descriptions }
    allow(journey_option2).to receive(:journey_sequence_descriptions) { journey_sequence_descriptions }
  end

  describe '.display' do
    it 'should use the journey object to generate a string output from it' do
      expected = [
        'option1 description values',
        'Journey sequence:',
        '------------------------',
        'journey section description',
        '------------------------',
        'journey section description',
        "\n",
        'option2 description values',
        'Journey sequence:',
        '------------------------',
        'journey section description',
        '------------------------',
        "journey section description\n\n",
        'journey description values'
      ].join("\n")

      expect(ConsoleOutput.display(journey)).to eq expected
    end
  end
end
