require "spec_helper"
require "open3"

describe "Command Retry Script" do

  it "retries the execution 3 times" do
    stdout, stderr, status = Open3.capture3("utility/retry false")

    msg = [
      "[1/3] Execution Failed with exit status 1. Retrying.",
      "[2/3] Execution Failed with exit status 1. Retrying.",
      "[3/3] Execution Failed with exit status 1. No more retries.",
      ""
    ].join("\n")

    expect(stdout).to eq(msg)
    expect(status.exitstatus).to eq(1)
  end

  context "when the command contains complex bash logic" do
    it "can use the retry script if the commands are passed as a string" do
      stdout, stderr, status = Open3.capture3("utility/retry --times 3 'for i in {1..2}; { echo $i; }; false'")

      expect(status.exitstatus).to eq(1)

      expect(stdout).to eq([
        "1",
        "2",
        "[1/3] Execution Failed with exit status 1. Retrying.",
        "1",
        "2",
        "[2/3] Execution Failed with exit status 1. Retrying.",
        "1",
        "2",
        "[3/3] Execution Failed with exit status 1. No more retries.",
        ""
      ].join("\n"))
    end
  end

end
