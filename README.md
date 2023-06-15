# Setup VsDevOps Server

## I. Clone GIT Repository with Submodules
```
    # git clone https://github.com/iatanasov77/vs-devops-server.git .
    # git submodule init
    
    # git submodule update
    ; OR
    # git submodule update --init --force --remote # to fetch the HEAD of submodules
```
    The big problem when submodule update that says: 
            fatal: unable to connect to github.com:
            github.com[0: 140.82.118.3]: errno=Connection timed out
            Unable to fetch in submodule path 'vagrant.d/puppet/modules/composer'
            
    I solve the problem with this command:
```
    git config --global url."https://".insteadOf git://
```

    NOTE: To add a new git submodule run:
```
    # git submodule add -f https://github.com/puppetlabs/puppetlabs-docker vagrant.d/puppet/modules/docker
```
    If you use the Puppet librarian for puppet modules add vagrant plugin for this. See: https://github.com/voxpupuli/vagrant-librarian-puppet
```
    # vagrant plugin install vagrant-librarian-puppet
```

## II. Create Machine Configs and Run the Machine

1. Install Oracle's Virtual Box - https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant - https://www.vagrantup.com/downloads.html
3. Install needed Vagrant Plugins:
    ```
        # Vagrant plugin install vagrant-env
        # Vagrant plugin install vagrant-hostmanager
    ```
    
4. Create Configs

     ```
        # cp vagrant.d/vagrantConfig.yaml.examples vagrant.d/vagrantConfig.yaml
        # cp nagios.d/nagiosConfig.yml.dist nagios.d/nagiosConfig.yml
        # cp nagios.d/icingaConfig.yml.dist nagios.d/icingaConfig.yml
        # cp vault.d/secrets.json.example vault.d/secrets.json
    ```
    Edit Created Configs About Your Needs
    
5. Run the Machine
    ```
        # cp .env.dist .env
    ```
    Edit .env file if needed and than:
    ```
        # vagrant up
    ```

## III. Setup the web interface
    
    ```
        $ cd /vagrant/gui/vs-devops-dashboard
        $ yarn install --no-bin-links
        
        ; Create ENV VARIABLES
        $ cp src/environments/env_vars.ts.dist src/environments/env_vars.ts
        
        $ yarn run build
        ; OR
        $ yarn run dev
    ```
    
    