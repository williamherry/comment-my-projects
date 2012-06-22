describe NoteHelper do
  let(:project) { create(:project) }
  let(:category) { create(:category, label: 'General') }
  let(:note) { create(:note, category: category, value: 2) }

  describe :note_for do
    context 'when there is a vote' do
      it 'show notes with stars' do
        project.notes << note
        note_for(project, category).should == '<div class="notes">' \
          'General : ' \
          '<span class="star true"></span>' \
          '<span class="star true"></span>' \
          '<span class="star false"></span>' \
          '<span class="star false"></span>' \
          ' (2.0/4 - 1 vote)' \
        '</div>'
      end
    end

    context 'when there is no vote' do
      it 'give a message' do
        note_for(project, category).should == '<div class="notes">' \
        'General : ' \
        'Aucun vote' \
        '</div>'
      end
    end
  end
end
