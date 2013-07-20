every 2.hours do
  runner "Post.update_posts"
  runner "Video.update_videos"
end
