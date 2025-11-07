# Bump Minor Version

Fetch the latest semantic version tag, increment the minor version (reset patch to 0), create the new tag, and push it to remote.

Steps:
1. Fetch all tags from remote
2. Find the latest semantic version tag (format: vX.Y.Z)
3. Increment the minor version and reset patch to 0
4. Create an annotated tag with the new version
5. Push the tag to origin
