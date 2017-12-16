require "spec_helper"
require "open3"

describe "Command Retry Script" do

  it "retries the execution default number of times" do
    stdout, stderr, status = Open3.capture3("utility/retry false")

    msg = [
      "Execution Failed with exit status 1. Retrying [1/3].",
      "Execution Failed with exit status 1. Retrying [2/3].",
      "Execution Failed with exit status 1. Retrying [3/3].",
      ""
    ].join("\n")

    expect(stderr).to eq(msg)
  end

  context "when the command contains complex bash logic" do
    it "can use the retry script if the commands are passed as a string" do
      output = `utility/retry 3 'for i in {1..10}; { echo $i }; false'`

      msg = [
        ""
      ]

      expect(output).to eq(msg.join("\n"))
    end
  end

end
