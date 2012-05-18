require 'spec_helper'

describe Project do
  it { should have_many(:categories).through(:category_projects) }
  it { should have_many(:category_projects) }
  it { should have_many(:comments) }
  it { should have_many(:notes) }
  it { should belong_to(:user) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :url }

  it {
    should validate_format_of(:url)
           .with(/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix)
  }

  it "have a category on creation" do
    project = Project.create(title: "Title", url: "http://www.test.com")
    project.categories.first.label.should == "General"
    project.category_projects.first.description.should == 
      "Title : <a href=\"http://www.test.com\">http://www.test.com</a>"
  end

  describe :to_s do
    subject { Category.new(label: "Category").to_s}

    it { should == "Category" }
  end
end
