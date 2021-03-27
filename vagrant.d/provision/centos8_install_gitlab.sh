#!/bin/bash

#####################################################################################
# https://computingforgeeks.com/how-to-install-and-configure-gitlab-on-centos-rhel/
#####################################################################################

echo "installing GitLab CE on CentOs 8"

# Edit /etc/yum.repos.d/gitlab_official_ce.repo
cat > /etc/yum.repos.d/gitlab_official_ce.repo <<DELIM
[gitlab_official_ce]
baseurl=https://packages.gitlab.com/gitlab/gitlab-ce/el/7/$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey/gitlab-gitlab-ce-3D645A26AB9FBD22.pub.gpg
sslverify=1
assumeyes=True
DELIM

# Install
yum makecache
yum install gitlab-ce -y --nobest
