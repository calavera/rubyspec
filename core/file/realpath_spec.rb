require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../shared/real_path', __FILE__)

ruby_version_is "1.9" do
  describe "File.realpath" do
    it_behaves_like :realpath, :realpath

    it "raises Errno::ENOENT trying to expand '~' from the current working directory" do
      lambda { File.realpath('~') }.should raise_error(Errno::ENOENT)
    end

    it "raises Errno::ENOENT if the file doesn't exist" do
      lambda { File.realpath('waduswadus') }.should raise_error(Errno::ENOENT)
    end
  end
end
