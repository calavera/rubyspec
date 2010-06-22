describe :realpath, :shared => true do
  before(:each) do
    @abs = File.expand_path(__FILE__)
  end

  it "returns the argument if it's an absolute pathname" do
    File.send(@method, @abs).should == @abs
  end

  it "resolves paths relative to the current working directory" do
    Dir.chdir(File.dirname(@abs)) do |dir|
      File.send(@method, File.expand_path('./' + File.basename(__FILE__))).should == @abs
    end
  end

  it "accepts a second argument of a directory from which to resolve the path" do
    File.send(@method, __FILE__, File.dirname(__FILE__)).should == @abs
  end

  it "calls #to_path on its argument" do
    File.send(@method, mock_to_path(@abs)).should == @abs
  end
end
