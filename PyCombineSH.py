

import os
import shutil
import subprocess

# Define your GitHub username and repository name
github_username = "your_username"
repository_name = "your_repository"

# Clone the repository
subprocess.run(["git", "clone", f"https://github.com/{github_username}/{repository_name}.git"])

# Combine the shell scripts into a single file
combined_script = ""
for filename in os.listdir(repository_name):
    if filename.endswith(".sh"):
        with open(os.path.join(repository_name, filename), "r") as f:
            combined_script += f.read() + "\n"

# Write the combined script to a file
with open("all_scripts.sh", "w") as f:
    f.write(combined_script)

# Make the script executable
os.chmod("all_scripts.sh", 0o755)

# Move the script to your desired location
shutil.move("all_scripts.sh", "/usr/local/bin/")
