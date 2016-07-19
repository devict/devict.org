#!bash -ex

# Generate the site
hugo --cleanDestinationDir -d public

# Switch to the deployment branch
git checkout master

# Cleanse out what's here including hidden files (but not .git or public/)
# Copy everything including hidden files from the generated public folder
find . -mindepth 1 -maxdepth 1 -not -name ".git" -not -name "public" -exec rm -rf {} \;
find ./public -mindepth 1 -maxdepth 1 -exec cp -a {} . \;

# Clean up
rm -rf ./public

# Stage it all and commit
git add -A
git commit -m "Site update for $(date)"

# Publish
git push origin master

# Go back to where we were
git checkout -
