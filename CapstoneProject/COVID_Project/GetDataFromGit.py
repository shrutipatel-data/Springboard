import git
import os
from git import Repo

#new_repo = git.Repo.init('new_repo')

git.Repo.clone_from("https://github.com/CSSEGISandData/COVID-19.git", "C:\\SpringBoard\\CapstoneProject\\Project_1\\test_repo",branch = 'master')
