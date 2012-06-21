#encoding=utf-8
require 'spec_helper'

describe CommentsController do
  let(:project) { build_stubbed(:project, user: user) }
  let(:comment) { build_stubbed(:comment) }
  let(:comments) { stub(find: comment, new: comment) }
  let(:user) { build_stubbed(:user) }

  before(:each) do
    sign_in user
    Project.stubs(:find).returns(project)
    project.stubs(:add_comment)
    project.stubs(:comments).returns(comments)
  end

  describe "GET 'new'" do
    it "render new template" do
      get 'new', project_id: project.id, format: :js
      should render_template('new')
    end
  end

  describe "POST 'create'" do
    before(:each) { Comment.stubs(:new).returns(comment) }

    context "with valid data" do
      before(:each) { comment.stubs(:valid?).returns(true) }

      it "render create template" do
        post 'create', project_id: project.id, format: :js
        should render_template('create')
      end

      it "add the new comment to the project" do
        project.expects(:add_comment).with(comment)
        post 'create', project_id: project.id, format: :js
      end
    end

    context "with invalid data" do
      before(:each) { comment.stubs(:valid?).returns(false) }

      it "render project's show template" do
        post 'create', project_id: project.id
        should render_template('projects/show')
      end
    end

    context "when user is signed in" do
      before(:each) do 
        comment.stubs(:save)
        sign_in user
      end

      it "add the user to comment" do
        post 'create', project_id: project.id
        comment.user.should == user
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      Comment.stubs(:find).returns(comment)
      comment.stubs(:destroy)
    end

    it "redirect to project's path" do
      delete 'destroy', id: comment.id, project_id: project.id
      should redirect_to(project)
    end

    it "delete the comment" do
      comment.expects(:destroy)
      delete 'destroy', id: comment.id, project_id: project.id
    end

    it "set a flash message" do
      delete 'destroy', id: comment.id, project_id: project.id
      should set_the_flash[:notice].to("Votre commentaire a été supprimé")
    end
  end
end
