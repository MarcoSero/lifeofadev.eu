atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @posts.each do |item|
    next if item.updated_at.blank?

    feed.entry( item ) do |entry|
      entry.url posts_url(item)
      entry.title item.title
      entry.content item.content, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

      User.find_by_id(item.user_id) do |author|
        entry.author author.username
      end
    end
  end
end