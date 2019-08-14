# Key Resources

An application for creating and querying for web resources (descriptions + links).

## Requirements

- Ruby 2.5
- Sqlite3 or MySQL (tested with MySQL 5.5)

## First-Time Setup (for developers)

```
git clone git@github.com:cul/ldpd-key-resources.git # Clone the repo
cd ldpd-key-resources # Switch to the application directory
bundle install # Install gem dependencies
yarn install # this assumes you have node and yarn installed (tested with Node 8 and Node 10)
...TODO: Add additional steps...
rails s -p 3000 # Start the application using rails server
```
And for faster React app recompiling during development, run this in a separate terminal window:

```
./bin/webpack-dev-server
```

Then navigate to http://localhost:3000 in your browser.

## Deployment
We use Capistrano for deployment. To deploy to our temporary dev instance run:
```
cap dev deploy
```
