## Uni

- Jiawen Chu:  jc5897
- Zeyu Zhang:  zz2941
- Shiyu Li:  sl4684
- Lei Xu:  lx2301

## How to run this program
- Heroku Link: https://w4152-mate.herokuapp.com/
- Download from git and run on ruby
  - In the config/environment.rb file, change the password to the API key in the README.txt file which submitted on canvas
  - Run the following command in terminal
    ```
    $ bundle install
    $ bundle exec rake db:reset                                      
    $ rails server
    ```
  - Open tab with the link http://localhost:3000
    
Be sure the bundle version is as below in Gemfile.lock:
```azure
BUNDLED WITH
   1.17.3
```


## How to test this program

if you want to run cucumber test:

```
$ bundle exec cucumber
```

if you want to run Rspec test:

```
$ bundle exec rspec
```

After running two kinds of test above, you can run ``index.html`` file to see the coverage. 
