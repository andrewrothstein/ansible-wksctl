andrewrothstein.wksctl
=========
![Build Status](https://github.com/andrewrothstein/ansible-wksctl/actions/workflows/build.yml/badge.svg)

Installs Weaveworks [wksctl](https://github.com/weaveworks/wksctl).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.wksctl
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
