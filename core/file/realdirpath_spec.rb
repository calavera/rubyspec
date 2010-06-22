require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../shared/real_path', __FILE__)

ruby_version_is "1.9" do
  describe "File.realdirpath" do
    it_behaves_like :realpath, :realdirpath

    it "resolves '~' like it was into the current working directory" do
      File.realdirpath('~').should == File.absolute_path('~')
    end

    it "doesn't raise Errno::ENOENT if the file doesn't exist" do
      lambda { File.readdirpath('waduswadus') }.should_not raise_error(Errno::ENOENT)
    end
  end
end
