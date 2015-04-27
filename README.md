# Bizflow-api

Bizflow-api is software for managing business processes online. It uses bizflow library and wraps the library logic into a web app (web service).

Its features are:
 - API calls to bizflow library
 - Restricting access
 - API versioning

This is a Rails app. To install run these commands in the project root:

$ bundle install
$ rake db:migrate
$ bundle exec bizflow install
$ bundle exec bizflow setup
$ bundle exec bizflow build
