## THIS CONFIGURATION IS MANAGED BY PUPPET
# for all possible parameters, see:
# https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/files/gitlab-config-template/gitlab.rb.template

## Url on which GitLab will be reachable.
## For more details on configuring external_url see:
## https://gitlab.com/gitlab-org/omnibus-gitlab/blob/629def0a7a26e7c2326566f0758d4a27857b52a3/README.md#configuring-the-external-url-for-gitlab
external_url 'http://devops.lh'


##################
# GitLab Unicorn #
##################
## Tweak unicorn settings.

unicorn['worker_timeout'] = 300

gitlab_rails['backup_upload_connection'] = {
  :provider => 'Local',
  :local_root => '/vagrant/docs/backup'
}

# The directory inside the mounted folder to copy backups to
# Use '.' to store them in the root directory
gitlab_rails['backup_upload_remote_directory'] = 'gitlab_backups'


