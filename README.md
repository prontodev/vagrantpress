VagrantPress for Pronto R&D Team
================================

Getting Started
---------------

Do the following steps on your local machine under your project directory, e.g., `~/Projects/`

1. Run `git clone git@github.com:prontodev/vagrantpress.git pronto_vagrantpress`
2. Run `cd pronto_vagrantpress`
3. Run `git submodule init`
4. Run `git submodule update`
5. Run `cd wordpress-test/bypronto`
6. Run `git branch` to show the branch list. By default, you won't be in any branch, you are just pointed to a particular commit of the submodule's repository.
  * If you see the `develop` branch, run `git checkout develop`
  * If not, run `git checkout -b develop origin/develop`
7. Go back to the root directory, e.g., `~/Projects/pronto_vagrantpress`
8. Run `vagrant up`. It takes time for only the first time running this command.


Useful Links
------------

* [How to use Git submodules](http://joncairns.com/2011/10/how-to-use-git-submodules/)
* [Git submodules: Specify a branch/tag](http://stackoverflow.com/questions/1777854/git-submodules-specify-a-branch-tag)
