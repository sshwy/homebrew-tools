# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "pku3b" do
  version "0.6.0"
  sha256 "7c956bd1e1aaa97b6a112aea6714f6334ae0f4c6e09300cc69603f8d859bc770"

  url "https://github.com/sshwy/pku3b/releases/download/#{version}/pku3b-#{version}-aarch64-apple-darwin.tar.gz",
      verified: "github.com/sshwy/pku3b/"
  name "pku3b"
  desc "Better BlackBoard for PKUers"
  homepage "https://github.com/sshwy/pku3b"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://api.github.com/repos/sshwy/pku3b/tags?per_page=50"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :json do |json, regex|
      json.map do |tag|
        match = tag["name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
    throttle 50
  end

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  # app ""
  binary "pku3b-#{version}-aarch64-apple-darwin/pku3b"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: [
    "~/Library/Application Support/org.sshwy.pku3b",
    "~/Library/Caches/org.sshwy.pku3b",
  ]
end
