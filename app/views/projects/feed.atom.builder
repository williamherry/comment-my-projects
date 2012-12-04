atom_feed language: 'fr-FR' do |feed|
  feed.title 'Projets de Comment-My-Projects'
  feed.updated @updated

  @projects.each do |project|
    feed.entry(project) do |entry|
      content = markdown(project.category_projects.first.description)
      entry.url project_path(project)
      entry.title project.title
      entry.content content, type: 'html'
      entry.updated(project.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))

      entry.author do |author|
        author.name project.user.username
      end
    end
  end
end