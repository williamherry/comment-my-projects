#encoding=utf-8
require 'spec_helper'

describe 'Follow' do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  describe 'Create' do
    it 'add the user to the followers' do
      sign_in user
      visit project_path(project)
      click_link "Suivre le projet"
      page.should have_content("Vous suivez #{project}.")
      page.should have_content("Arréter de suivre le projet")
    end

    it 'remove the user from the followers' do
      sign_in user
      project.add_follower(user)
      visit project_path(project)
      click_link "Arréter de suivre le projet"
      page.should have_content("Vous ne suivez plus #{project}.")
      page.should have_content("Suivre le projet")
    end
  end
end