Unified Tokenly API Documentation
==============================


Slate Documentation
------------------------------

Tokenly API Docs generator is based on [Slate](https://github.com/tripit/slate).  See their [documentation](https://github.com/tripit/slate) for how to use Slate.  Also see [editing Slate markdown](https://github.com/tripit/slate/wiki/Markdown-Syntax).



Local Development
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Clone this repository to your hard drive with `git clone https://github.com/tokenly/api-docs.git`
2. `cd api-docs`
3. Initialize Slate

```shell
bundle install
```

### Working on a project

To work on an API documentation folder, you must "check out" the folder for local development.

1. In the top level directory, run `./scripts/checkout-folder.sh FOLDER_NAME`
2. Then, run `bundle exec middleman server --verbose`.  You can now see the docs at http://localhost:4567.
3. When you are done working, you must commit your project back to the sources directory.  Run `./scripts/commit-folder.sh`



Adding a new documentation folder
------------------------------

1. Copy a folder in sources and rename it to your new folder name.
2. Edit layouts/layout.erb in each folder located in sources.
3. Add the new folder in the navigation HTML markup.  Be sure to change the active class in your new folder.
